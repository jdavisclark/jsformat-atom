{WorkspaceView} = require 'atom'
require 'file'

format = require '../lib/format'

describe "JSFormat package tests", ->
  beforeEach ->
    atom.workspaceView = new WorkspaceView()
    atom.workspace = atom.workspaceView.model

  # JSFormat tests here

  describe "when the textbuffer is being formatted", ->
    beforeEach ->
      atom.workspaceView.attachToDom()

    it "can format the whole buffer with the use of the command", ->
      # general format test

      waitsForPromise ->
        atom.workspace.open('specfiles/index.js')

      runs ->
        atom.workspaceView.getActiveView().trigger 'jsformat:format'

      waitsFor ->
        format::format.callCount > 0

      runs ->
        formattedFile = new File 'specfiles/index-formatted.js'
        expect(atom.workspaceView.getActiveTextEditor().getText()).toEqual(formattedFile.read())
