DesktopsController = Marionette.Controller.extend
	initialize: ({
		@app
		@desktopSubset
		@desktopCollection
		@notesCollection
		@currentDesktopNotesCollection
	}) ->

	changeDesktop: (id) ->
		if not id
			desktop = @desktopCollection.at 0
		else
			id = parseInt id, 10
			desktop = @desktopCollection.get id

		if not desktop
			return

		@app.currentDesktop = desktop

		@desktopSubset.setFilter (note) -> note.get('desktop_id') == id
		@desktopSubset.refresh()