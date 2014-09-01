TextNoteView = Backbone.Marionette.ItemView.extend
	tagName: 'li'
	attributes: ->
		return {
			class: 'text-note note'
			style: 'top:' + @model.get('top') + 'px; left:' + @model.get('left') + 'px'
		}
	template: Handlebars.compile($('#text-note-template').html())
