ImageNoteView = Backbone.Marionette.ItemView.extend
	tagName: 'li'
	attributes: ->
		return {
			class: 'image-note note'
			style: 'top:' + @model.get('top') + 'px; left:' + @model.get('left') + 'px'
		}
	template: Handlebars.compile($('#image-note-template').html())
