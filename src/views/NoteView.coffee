class NoteView extends Backbone.Marionette.ItemView
	tagName: 'li'
	attributes: ->
		return {
			class: 'note'
			style: 'top:' + @model.get('top') + 'px; left:' + @model.get('left') + 'px'
		}
	template: Handlebars.compile($('#image-note-template').html())
	onShow: ->
		@$el.draggable()
