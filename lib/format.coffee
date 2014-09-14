FileTypeNotSupportedView = require './not-supported-view'

jsbeautify = (require 'js-beautify').js_beautify

module.exports =
  configDefaults:
    format_on_save: true,
    indent_with_tabs: false,
    max_preserve_newlines: 4,
    preserve_newlines: true,
    space_in_paren: false,
    jslint_happy: false,
    brace_style: "collapse",
    keep_array_indentation: false,
    keep_function_indentation: false,
    space_before_conditional: true,
    eval_code: false,
    unescape_strings: false,
    break_chained_methods: false,
    e4x: false

  activate: (state) ->
    atom.workspaceView.command "jsformat:format", => @format(state)

    if atom.config.get('jsformat.format_on_save') ? @configDefaults['format_on_save']
      # event is only attached once user has called JSFormat once,
      # figure out how to set this up at the beginning on any supported file
      buffer = atom.workspace.getActivePaneItem().getBuffer()

      @editorCreationSubscription = atom.workspace.onDidAddTextEditor (event) =>
        grammar = event.textEditor.getGrammar()?.scopeName

        if grammar is 'source.json' or grammar is 'source.js'
          @fileSaveSubscription = buffer.onWillSave =>
            buffer.transact =>
              @formatJavascript(state)

          @fileCloseSubscription = buffer.onDidDestroy =>
            @fileSaveSubscription.dispose()
            @fileCloseSubscription.dispose()

  format: (state) ->
    editor = atom.workspace.activePaneItem

    if !editor
      return

    grammar = editor.getGrammar()?.scopeName

    if grammar is 'source.json' or grammar is 'source.js'
      @formatJavascript editor
    else
      notification = new FileTypeNotSupportedView(state)
      atom.workspaceView.append(notification)
      destroyer = () ->
        notification.detach()

      setTimeout destroyer, 1500

  formatJavascript: (editor) ->
    settings = atom.config.getSettings().editor
    opts = {
      indent_size: editor.getTabLength(),
      wrap_line_length: settings.preferredLineLength
    }

    for configKey, defaultValue of @configDefaults
      opts[configKey] = atom.config.get('jsformat.' + configKey) ? defaultValue

    if @selectionsAreEmpty editor
      editor.setText(jsbeautify(editor.getText(), opts))
    else
      for selection in editor.getSelections()
        selection.insertText(jsbeautify(selection.getText(), opts), {select:true})

  selectionsAreEmpty: (editor) ->
    for selection in editor.getSelections()
      return false unless selection.isEmpty()
    true
