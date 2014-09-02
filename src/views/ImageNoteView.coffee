class ImageNoteView extends NoteView
	attributes: ->
		_(class: 'note note-theme image').defaults super


	template: Handlebars.compile($('#image-note-template').html())
