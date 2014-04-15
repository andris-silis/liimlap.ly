CreateNoteView = Backbone.View.extend
	template: Handlebars.compile($('#create-note-template').html())
	events:
		'click .text': 'addText'
		'click .image': 'addImage'
	initialize: ({ @notesCollection, @currentDesktop }) ->
	addText: ->
		@notesCollection.create
			type: 'text'
			desktop_id: @currentDesktop.get('id')
	addImage: ->
		@notesCollection.create
			type: 'image'
			desktop_id: @currentDesktop.get('id')
	render: ->
		@$el.html @template()
		@
