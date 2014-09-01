class TextNoteView extends NoteView
	attributes: ->
		_(class: 'text-note note').defaults super


	ui: {
		editor: 'div'
	}


	events: ->
		_({ 'blur @ui.editor': '_onBlur' }).defaults super


	template: Handlebars.compile($('#text-note-template').html())


	_onDoubleClick: ->
		@_makeEditable()


	_makeEditable: ->
		@ui.editor
			.prop('contenteditable', true)
			.focus()


	_onBlur: ->
		@ui.editor.prop('contenteditable', false)

		text = @ui.editor.html()
		text = text.trim()

		@app.vent.trigger 'change:note-text', @model, text
