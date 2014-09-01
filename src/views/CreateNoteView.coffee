class CreateNoteView extends Backbone.View
	template: Handlebars.compile($('#create-note-template').html())


	events:
		'click .text': '_addText'
		'click .image': '_addImage'


	initialize: ({ @app }) ->


	_addText: ->
		@app.vent.trigger 'create:note', type: 'text'


	_addImage: ->
		@app.vent.trigger 'create:note', type: 'image'


	render: ->
		@$el.html @template()
		@
