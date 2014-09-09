class CreateDesktopView extends Backbone.Marionette.View
  template: App.templates['create-desktop']


  ui:
    createDesktop: 'button'


  events:
    'click @ui.createDesktop': '_addDesktop'


  initialize: ({ @app }) ->


  _addDesktop: ->
    @app.vent.trigger 'create:desktop'


  render: ->
    @$el.html @template()
    @
