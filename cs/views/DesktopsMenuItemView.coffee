DesktopsMenuItemView = Backbone.Marionette.ItemView.extend
	tagName: 'li'
	template: Handlebars.compile($('#desktop-menu-item-template').html())
