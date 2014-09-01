class CreateNoteView extends Backbone.Marionette.View
	template: Handlebars.compile($('#create-note-template').html())


	ui:
		createText: '.text'
		createImage: '.image'


	events:
		'click @ui.createText': '_addText'
		'click @ui.createImage': '_addImage'


	initialize: ({ @app }) ->


	_addText: ->
		@app.vent.trigger 'create:note', type: 'text'


	_addImage: ->
		@app.vent.trigger 'create:note', type: 'image'


	render: ->
		@$el.html @template()
		@
