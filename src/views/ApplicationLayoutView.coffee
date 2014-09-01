class ApplicationLayoutView extends Backbone.Marionette.LayoutView
	template: "#application-layout-template",


	regions:
		createNoteMenu: "#add-note",
		createDesktopMenu: "#add-desktop",
		desktopsMenu: "#desktops-menu",
		desktop: "#desktop"
