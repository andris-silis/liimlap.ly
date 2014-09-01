class DesktopsMenuItemView extends Backbone.Marionette.ItemView
	tagName: 'li'


	attributes: ->
		if @model == @options.currentDesktop
			class: 'active'


	template: Handlebars.compile($('#desktop-menu-item-template').html())
