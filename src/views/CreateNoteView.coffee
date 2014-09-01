class CreateNoteView extends Backbone.View
	template: Handlebars.compile($('#create-note-template').html())


	events:
		'click .text': '_addText'
		'click .image': '_addImage'


	initialize: ({
		@notesCollection,
		@app
	}) ->


	_addText: ->
		@notesCollection.create
			type: 'text'
			desktop_id: @app.currentDesktop.get('id')


	_addImage: ->
		@notesCollection.create
			type: 'image'
			desktop_id: @app.currentDesktop.get('id')


	render: ->
		@$el.html @template()
		@
