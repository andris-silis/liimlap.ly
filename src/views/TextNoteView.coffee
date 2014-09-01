class TextNoteView extends NoteView
	attributes: ->
		_(class: 'text-note note').defaults super


	template: Handlebars.compile($('#text-note-template').html())
