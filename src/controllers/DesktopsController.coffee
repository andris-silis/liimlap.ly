class DesktopsController extends Marionette.Controller
	initialize: ({
		@app
		@desktopSubset
		@desktopsCollection
	}) ->
		@listenTo @app.vent, 'create:desktop', @_onCreateDesktop


	changeDesktop: (id) ->
		if not id
			desktop = @desktopsCollection.at 0
		else
			id = parseInt id, 10
			desktop = @desktopsCollection.get id

		if not desktop
			return

		@_filterDesktopSubset(id)

		@app.vent.trigger 'change:desktop', desktop

		@currentDesktop = desktop


	_filterDesktopSubset: (desktop_id) ->
		@desktopSubset.setFilter (note) ->
			note.get('desktop_id') == desktop_id
		@desktopSubset.refresh()


	_onCreateDesktop: ->
		console.log '_onCreateDesktop'
		@desktopsCollection.create()
