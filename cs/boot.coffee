$ ->
	app = {}
	app.collections = {}
	app.views = {}

	router = new Router app: app

	app.collections =
		desktops: new DesktopsCollection data.desktops
		notes: new NotesCollection data.notes
		currentDesktopNotes: new NotesCollection

	app.views =
		desktop: new DesktopView(
			collection: app.collections.currentDesktopNotes
			el: '#desktop'
		).render()
		desktopsMenu: new DesktopsMenuView(
			collection: app.collections.desktops
			el: '#desktops-menu'
		).render()


	window.app = app

	Backbone.history.start()
