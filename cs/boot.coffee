$ ->
	window.app = app = new Backbone.Marionette.Application()

	app.addInitializer (options) ->
		@collections = {}

		@collections =
			desktops: new DesktopsCollection data.desktops
			notes: new NotesCollection data.notes

		@desktopSubset = new Backbone.CollectionSubset(
			parent: @collections.notes
			filter: -> true
		)

		@currentDesktop = new DesktopModel

		@stateCollections =
			currentDesktopNotes: @desktopSubset.child

	app.addInitializer (options) ->
		desktopsController = new DesktopsController(
			app: @
			desktopSubset: @desktopSubset
			desktopCollection: @collections.desktops
			currentDesktopNotesCollection: @stateCollections.currentDesktopNotes
			notesCollection: @collections.notes
		)

		new DesktopsRouter(
			controller: desktopsController
		)

		Backbone.history.start()

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


	app.start()
