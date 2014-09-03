class DesktopsController extends Marionette.Controller
	initialize: ({
		@app
		@desktopSubset
		@desktopsCollection
	}) ->
		@listenTo @app.vent, 'create:desktop', @_onCreateDesktop


	changeDesktop: (id) ->
		desktop = @_getDesktopById id

		@_filterDesktopSubset desktop.id

		@app.vent.trigger 'change:desktop', desktop

		@currentDesktop = desktop


	_getDesktopById: (id) ->
		if not id
			desktop = @desktopsCollection.at 0
		else
			id = parseInt id, 10
			desktop = @desktopsCollection.get id

		if not desktop
			desktop = @desktopsCollection.createWithNextName()

		desktop


	_filterDesktopSubset: (desktop_id) ->
		@desktopSubset.setFilter (note) ->
			note.get('desktop_id') == desktop_id
		@desktopSubset.refresh()


	_onCreateDesktop: ->
		@desktopsCollection.createWithNextName()
