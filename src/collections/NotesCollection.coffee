class NotesCollection extends Backbone.Collection
	localStorage: new Backbone.LocalStorage 'notes'
	model: NoteModel
	url: 'notes'