class DesktopView extends Backbone.Marionette.CollectionView
  tagName: 'ul'

  initialize: ({ @collection, @app }) ->


  childViewOptions: ->
    {
      app: @app
    }


  getChildView: (item) ->
    if item.get('type') == 'image'
      return ImageNoteView
    TextNoteView
