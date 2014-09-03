class ImageNoteView extends NoteView
	template: App.templates['image-note']


	attributes: ->
		_(class: 'note note-theme image').defaults super
