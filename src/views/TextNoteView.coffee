TextNoteView = Backbone.Marionette.ItemView.extend
	tagName: 'li'
	attributes: ->
		return {
			class: 'text-note note'
			style: 'top:' + @model.get('top') + '; left:' + @model.get('left')
		}
	template: Handlebars.compile($('#text-note-template').html())
