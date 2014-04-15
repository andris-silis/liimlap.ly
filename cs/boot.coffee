$ ->
	window.app = app = {}


	app.collections = {}
	app.views = {}

	app.currentDesktop = new DesktopModel

	app.stateCollections =
		currentDesktopNotes: new NotesCollection

	app.collections =
		desktops: new DesktopsCollection data.desktops
		notes: new NotesCollection data.notes

	app.views =
		desktop: new DesktopView(
			collection: app.stateCollections.currentDesktopNotes
			el: '#desktop'
		).render()
		desktopsMenu: new DesktopsMenuView(
			collection: app.collections.desktops
			el: '#desktops-menu'
		).render()

	router = new Router(
		currentDesktopNotesCollection: app.stateCollections.currentDesktopNotes
		notesCollection: app.collections.notes
		currentDesktop: app.currentDesktop
	)

	Backbone.history.start()

