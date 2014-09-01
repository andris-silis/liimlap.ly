class DesktopsCollection extends Backbone.Collection
	localStorage: new Backbone.LocalStorage 'desktops'


	url: 'desktops'


	createWithNextName: ->
		console.log 'createWithNextName'
		number = @size() + 1
		title = "Desktop #{number}"
		@create(title: title)
