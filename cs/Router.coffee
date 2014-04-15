Router = Backbone.Router.extend
	routes:
		'': 'desktop',
		'desktop/:id': 'desktop'

	initialize: ({
		@desktopCollection,
		@notesCollection,
		@currentDesktopNotesCollection,
		@currentDesktop
	}) ->

	desktop: (id) ->
		if not id
			firstDesktop = @app.collections.desktops.at(0)
			if not firstDesktop
				return
			id = firstDesktop.get('id')

		id = parseInt id, 10
		@currentDesktopNotesCollection.reset @notesCollection.where(desktop_id: id)
