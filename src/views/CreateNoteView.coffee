class CreateNoteView extends Backbone.View
	template: Handlebars.compile($('#create-note-template').html())
	events:
		'click .text': 'addText'
		'click .image': 'addImage'
	initialize: ({ @notesCollection, @app }) ->
	addText: ->
		@notesCollection.create
			type: 'text'
			desktop_id: @app.currentDesktop.get('id')
	addImage: ->
		@notesCollection.create
			type: 'image'
			desktop_id: @app.currentDesktop.get('id')
	render: ->
		@$el.html @template()
		@
