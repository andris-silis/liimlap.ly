class DesktopsMenuItemView extends Backbone.Marionette.ItemView
	template: App.templates['desktop-menu-item']


	tagName: 'li'


	attributes: ->
		if @model == @options.currentDesktop
			class: 'active'


