ImageNoteView = Backbone.Marionette.ItemView.extend
	tagName: 'li'
	template: Handlebars.compile($('#image-note-template').html())
