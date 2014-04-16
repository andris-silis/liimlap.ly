$ ->
	window.app = app = {}


	app.collections = {}
	app.views = {}

	app.collections =
		desktops: new DesktopsCollection data.desktops
		notes: new NotesCollection data.notes

	app.desktopSubset = new Backbone.CollectionSubset(
	  parent: app.collections.notes,
	  filter: -> true
	)

	app.currentDesktop = new DesktopModel

	app.stateCollections =
		currentDesktopNotes: app.desktopSubset.child

	app.views =
		desktop: new DesktopView(
			collection: app.stateCollections.currentDesktopNotes
			el: '#desktop'
		).render()
		desktopsMenu: new DesktopsMenuView(
			collection: app.collections.desktops
			currentDesktop: app.currentDesktop
			el: '#desktops-menu'
		).render()
		createNote: new CreateNoteView(
			notesCollection: app.collections.notes
			currentDesktop: app.currentDesktop
			el: '#add-note'
		).render()


	router = new Router(
		desktopSubset: app.desktopSubset
		desktopCollection: app.collections.desktops
		currentDesktopNotesCollection: app.stateCollections.currentDesktopNotes
		notesCollection: app.collections.notes
		currentDesktop: app.currentDesktop
	)

	Backbone.history.start()

