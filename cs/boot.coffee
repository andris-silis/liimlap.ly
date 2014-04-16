$ ->
	window.app = app = new Backbone.Marionette.Application()

	app.addInitializer (options) ->
		@collections = {}
		@views = {}

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

		@views =
			desktop: new DesktopView(
				collection: @stateCollections.currentDesktopNotes
				el: '#desktop'
			).render()
			desktopsMenu: new DesktopsMenuView(
				collection: @collections.desktops
				currentDesktop: @currentDesktop
				el: '#desktops-menu'
			).render()
			createNote: new CreateNoteView(
				notesCollection: @collections.notes
				app: @
				el: '#add-note'
			).render()

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

	app.start()
