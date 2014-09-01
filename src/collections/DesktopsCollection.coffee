class DesktopsCollection extends Backbone.Collection
	localStorage: new Backbone.LocalStorage 'desktops'
	url: 'desktops'
