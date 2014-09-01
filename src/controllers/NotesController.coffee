class NotesController extends Marionette.Controller
	initialize: ({
		@app
		@notesCollection
	}) ->
		@listenTo @app.vent, 'change:desktop', @_onChangeDesktop
		@listenTo @app.vent, 'create:note', @_onCreateNote
		@listenTo @app.vent, 'change:note-position', @_onChangeNotePosition


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
