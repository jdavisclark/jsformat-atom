{View} = require 'atom'
path = require 'path'

module.exports =
class NotSupportedNotificationView extends View
  constructor: (state, @message) ->
    this.message = @message
    super state

  @content: ->
    editor = atom.workspace.activePaneItem
    title = editor.getTitle()
    ext = path.extname title

    @div class: 'test overlay from-top', =>
      @div "Format: '#{ext}' files not yet supported.", class: "message"
