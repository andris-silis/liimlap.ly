$ ->
	app = {}
	app.collections = {}
	app.views = {}

	router = new Router app: app
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


	window.app = app

	Backbone.history.start()
