class ImageNoteView extends NoteView
  template: App.templates['image-note']


  attributes: ->
    _(class: 'note note-theme image').defaults super


  _onDoubleClick: ->
    url = prompt 'Enter URL'

    @app.vent.trigger 'change:note-image-url', @model, url
