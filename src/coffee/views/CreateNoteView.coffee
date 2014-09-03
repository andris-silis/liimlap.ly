class CreateNoteView extends Backbone.Marionette.View
	template: App.templates['create-note']


	ui:
		createText: '.text'
		createImage: '.image'


	events:
		'click @ui.createText': '_addText'
		'click @ui.createImage': '_addImage'


	initialize: ({ @app }) ->


	_addText: ->
		@app.vent.trigger 'create:note', 'text'


	_addImage: ->
		@app.vent.trigger 'create:note', 'image'


	render: ->
		@$el.html @template()
		@
