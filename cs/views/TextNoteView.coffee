TextNoteView = Backbone.Marionette.ItemView.extend
	tagName: 'li'
	template: Handlebars.compile($('#text-note-template').html());
