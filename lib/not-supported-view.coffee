{View} = require 'atom-space-pen-views'
path = require 'path'

module.exports =
class NotSupportedNotificationView extends View
  constructor: (@fileType) ->
    this.fileType = @fileType
    super()

  @content: ->
    editor = atom.workspace.activePaneItem
    title = editor.getTitle()
    ext = path.extname title
    message = ext.length > 0 ? ext : title

    @div class: 'test overlay from-top', =>
      @div "Formatting '#{message}' files is not yet supported.", class: "message"
