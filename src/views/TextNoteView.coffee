class TextNoteView extends NoteView
	attributes: ->
		_(class: 'text-note note').defaults super


	template: Handlebars.compile($('#text-note-template').html())


	_onDoubleClick: ->
		@_makeEditable()


	_makeEditable: ->
		$textarea = $ '<textarea>'
		@$el.append $textarea
		@_adjustEditableElementSizes(@$el, $textarea)


	_adjustEditableElementSizes: ($el, $textarea) ->
		$textarea.outerWidth @$el.innerWidth()
		$textarea.outerHeight @$el.innerHeight()
