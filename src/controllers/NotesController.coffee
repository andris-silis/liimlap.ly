class NotesController extends Marionette.Controller
	initialize: ({
		@app
		@notesCollection
	}) ->
		@listenTo @app.vent, 'change:desktop', @_onChangeDesktop
		@listenTo @app.vent, 'create:note', @_onCreateNote


	_onChangeDesktop: (desktop) ->
		@currentDesktop = desktop


	_onCreateNote: (type) ->
		@notesCollection.create
			type: type
			desktop_id: @currentDesktop.get('id')
