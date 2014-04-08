FileTypeNotSupportedView = require './not-supported-view'

path = require 'path'
jsbeautify = (require 'js-beautify').js_beautify

module.exports =
  configDefaults:
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
    e4x: false,
    format_on_save: true

  activate: (state) ->
    atom.workspaceView.command "jsformat:format", => @format state

    atom.config.observe 'jsformat.format_on_save', =>
      @configureEvents()

  deactivate: ->
    atom.workspaceView.eachEditorView (editorView) =>
      @handleEvents(editorView, false)

  configureEvents: ->
    atom.workspaceView.eachEditorView (editorView) =>
      @handleEvents(editorView, atom.config.get('jsformat.format_on_save'))

  handleEvents: (editorView, add) ->
    editor = editorView.getEditor()
    buffer = editor.getBuffer()
    if add
      buffer.on 'will-be-saved', => @format()
      editor.on 'destroyed', => buffer.off 'will-be-saved'
    else
      buffer.off 'will-be-saved'
      editor.off 'destroyed'

  format: (state) ->
    editor = atom.workspace.activePaneItem

    if !editor
      return

    grammar = editor.getGrammar()?.scopeName

    if grammar is 'source.json' or grammar is 'source.js'
      @formatJavascript editor
    else if state
      notification = new FileTypeNotSupportedView(state)
      atom.workspaceView.append(notification)
      destroyer = () ->
        notification.detach()

      setTimeout destroyer, 1500

  formatJavascript: (editor) ->
    settings = atom.config.getSettings().editor
    opts = {
      indent_size: settings.tabLength,
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
