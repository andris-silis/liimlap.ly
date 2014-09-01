ImageNoteView = Backbone.Marionette.ItemView.extend
	tagName: 'li'
	attributes: ->
		return {
			class: 'image-note note'
			# style: 'top:' + @model.get('top') + '; left:' + @model.get('left')
		}
	template: Handlebars.compile($('#image-note-template').html())
