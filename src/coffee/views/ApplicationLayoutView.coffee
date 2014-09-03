class ApplicationLayoutView extends Backbone.Marionette.LayoutView
	template: App.templates['application-layout'],


	regions:
		createNoteMenu: "#add-note",
		createDesktopMenu: "#add-desktop",
		desktopsMenu: "#desktops-menu",
		desktop: "#desktop"
