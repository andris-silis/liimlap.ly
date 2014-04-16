DesktopsMenuItemView = Backbone.Marionette.ItemView.extend
	tagName: 'li'
	attributes: ->
		if @model == @options.currentDesktop
			class: 'active'
	template: Handlebars.compile($('#desktop-menu-item-template').html())
