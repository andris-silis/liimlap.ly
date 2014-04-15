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
			desktop = @desktopCollection.at 0
		else
			id = parseInt id, 10
			desktop = @desktopCollection.get id

		if not desktop
			return

		@currentDesktop = desktop
		@currentDesktopNotesCollection.reset @notesCollection.where(desktop_id: id)
