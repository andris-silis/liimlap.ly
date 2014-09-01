class DesktopsCollection extends Backbone.Collection
	localStorage: new Backbone.LocalStorage 'desktops'


	url: 'desktops'


	createWithNextName: ->
		number = @size() + 1
		title = "Desktop #{number}"
		@create(id: number, title: title)
