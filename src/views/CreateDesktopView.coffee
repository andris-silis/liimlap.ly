class CreateDesktopView extends Backbone.Marionette.View
	template: Handlebars.compile($('#create-desktop-template').html())


	ui:
		createDesktop: 'button'


	events:
		'click @ui.createDesktop': '_addDesktop'


	initialize: ({ @app }) ->
		console.log 'CreateDesktopView'


	_addDesktop: ->
		console.log '_addDesktop'
		@app.vent.trigger 'create:desktop'


	render: ->
		@$el.html @template()
		@
