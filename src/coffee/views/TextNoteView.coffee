class TextNoteView extends NoteView
	template: App.templates['text-note']


	attributes: ->
		_(class: 'note note-theme text').defaults super


	ui: {
		editor: 'div'
	}


	events: ->
		_({ 'blur @ui.editor': '_onBlur' }).defaults super


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
