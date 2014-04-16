Router = Backbone.Router.extend
	routes:
		'': 'desktop',
		'desktop/:id': 'desktop'

	initialize: ({
		@desktopCollection,
		@notesCollection,
		@currentDesktopNotesCollection,
		@currentDesktop
		@app
		@desktopSubset
	}) ->

	desktop: (id) ->
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
