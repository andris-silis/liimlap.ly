class NoteView extends Backbone.Marionette.ItemView
	tagName: 'li'


	events:
		'dragstop': '_onDragStop'


	attributes: ->
		return {
			class: 'note'
			style: 'top:' + @model.get('top') + 'px; left:' + @model.get('left') + 'px'
		}


	template: Handlebars.compile($('#image-note-template').html())


	onShow: ->
		@$el.draggable()


	_onDragStop: (event, ui) ->
		@_savePosition ui.position.top, ui.position.left


	_savePosition: (top, left) ->
		@model.save
			top: top
			left: left
