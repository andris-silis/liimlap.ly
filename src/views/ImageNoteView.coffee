class ImageNoteView extends NoteView
	attributes: ->
		_(class: 'image-note note').defaults super


	template: Handlebars.compile($('#image-note-template').html())
