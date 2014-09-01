class NoteView extends Backbone.Marionette.ItemView
	tagName: 'li'


	events: ->
		{
			'dragstop': '_onDragStop'
			'dblclick': '_onDoubleClick'
		}


	attributes: ->
		{
			class: 'note'
			style: 'top:' + @model.get('top') + 'px; left:' + @model.get('left') + 'px'
		}


	template: Handlebars.compile($('#image-note-template').html())


	initialize: ({ @app }) ->
		@listenTo @model, 'change', @render


	onShow: ->
		@$el.draggable()


	_onDragStop: (event, ui) ->
		@app.vent.trigger 'change:note-position',
			@model,
			ui.position.top,
			ui.position.left
