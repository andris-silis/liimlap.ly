$ ->
	window.app = app = new Backbone.Marionette.Application()


	app.addInitializer (options) ->
		@collections = {}

		@collections =
			desktops: new DesktopsCollection
			notes: new NotesCollection

		@collections.desktops.fetch()
		@collections.notes.fetch()

		@desktopSubset = new Backbone.CollectionSubset(
			parent: @collections.notes
		)

		@currentDesktop = new DesktopModel

		@stateCollections =
			currentDesktopNotes: @desktopSubset.child


	app.addInitializer (options) ->
		desktopsController = new DesktopsController(
			app: @
			desktopSubset: @desktopSubset
			desktopCollection: @collections.desktops
		)

		@desktopsRouter = new DesktopsRouter(
			controller: desktopsController
		)


	app.addInitializer (options) ->
		@layout = new ApplicationLayout(
			el: 'body'
		)
		@layout.render()


	app.addInitializer (options) ->
		@layout.desktopsMenu.show(
			new DesktopsMenuView(
				collection: @collections.desktops
				currentDesktop: @currentDesktop
				app: @
			)
		)

		@layout.createNodeMenu.show(
			new CreateNoteView(
				notesCollection: @collections.notes
				app: @
			)
		)

		@layout.desktop.show(
			new DesktopView(
				collection: @stateCollections.currentDesktopNotes
			)
		)


	app.on 'start', (options) ->
		if Backbone.history
			Backbone.history.start()


	app.start()
