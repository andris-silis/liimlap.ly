class ImageNoteView extends NoteView
	attributes: ->
		return _({
			class: 'image-note note'
		}).defaults super


	template: Handlebars.compile($('#image-note-template').html())
