class NotesController extends Marionette.Controller
  initialize: ({
    @app
    @notesCollection
  }) ->
    @listenTo @app.vent, 'change:desktop', @_onChangeDesktop
    @listenTo @app.vent, 'create:note', @_onCreateNote
    @listenTo @app.vent, 'change:note-position', @_onChangeNotePosition
    @listenTo @app.vent, 'change:note-text', @_onChangeNoteText
    @listenTo @app.vent, 'change:note-image-url', @_onChangeNoteImageURL


  _onChangeDesktop: (desktop) ->
    @currentDesktop = desktop


  _onCreateNote: (type) ->
    @notesCollection.create
      type: type
      desktop_id: @currentDesktop.get('id')


  _onChangeNotePosition: (note, top, left) ->
    note.save
      top: top
      left: left


  _onChangeNoteText: (note, text) ->
    note.save
      text: text


  _onChangeNoteImageURL: (note, url) ->
    note.save
      imageUrl: url
