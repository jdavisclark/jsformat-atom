FileTypeNotSupportedView = require './not-supported-view'

path = require 'path'
jsbeautify = (require 'js-beautify').js_beautify

module.exports =
  activate: (state) ->
    atom.workspaceView.command "jsformat:format", => @format(state)

  format: (state) ->
    editor = atom.workspace.activePaneItem

    if !editor
      return

    ext = path.extname editor.getTitle()

    if ext == '.js' or ext == '.json'
      @formatJavascript editor
    else
      notification = new FileTypeNotSupportedView(state)
      atom.workspaceView.append(notification)
      destroyer = () ->
        notification.detach()

      setTimeout destroyer, 1500


  formatJavascript: (editor) ->
    opts = {}
    editor.setText(jsbeautify(editor.getText(), opts))
