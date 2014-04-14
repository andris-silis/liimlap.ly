Router = Backbone.Router.extend
	routes:
		'': 'desktop',
		'desktop/:id': 'desktop'

	initialize: (options) ->
		@app = options.app

	desktop: (id) ->
		if not id
			firstDesktop = @app.collections.desktops.at(0)
			if not firstDesktop
				return
			id = firstDesktop.get('id')

		id = parseInt id, 10
		@app.collections.currentDesktopNotes.reset @app.collections.notes.where(desktop_id: id)


