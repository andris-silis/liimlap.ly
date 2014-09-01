ApplicationLayout = Backbone.Marionette.Layout.extend
	template: "#application-layout-template",

	regions:
		createNodeMenu: "#add-note",
		desktopsMenu: "#desktops-menu",
		desktop: "#desktop"
