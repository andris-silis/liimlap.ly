class NoteView extends Backbone.Marionette.ItemView
	template: App.templates['image-note']


	tagName: 'li'


	events: ->
		{
			'dragstop': '_onDragStop'
			'dblclick': '_onDoubleClick'
		}


	attributes: ->
		{
			style: 'top:' + @model.get('top') + 'px; left:' + @model.get('left') + 'px'
		}


	initialize: ({ @app }) ->
		@listenTo @model, 'change', @render


	onShow: ->
		@$el.draggable(
			containment: $('#desktop')
		)


	_onDragStop: (event, ui) ->
		@app.vent.trigger 'change:note-position',
			@model,
			ui.position.top,
			ui.position.left
