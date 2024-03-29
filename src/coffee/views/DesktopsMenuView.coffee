class DesktopsMenuView extends Backbone.Marionette.CollectionView
  tagName: 'ul'


  attributes:
    # It sux that element's class must be set here
    #   but it is a limitation of backbone
    'class': 'side-nav'


  childView: DesktopsMenuItemView


  childViewOptions: ->
    currentDesktop: @currentDesktop


  initialize: ({
    @app
    @collection
  }) ->
    @listenTo @app.vent, 'change:desktop', @_desktopChanged


  _desktopChanged: (desktop) ->
    @currentDesktop = desktop
    @render()

