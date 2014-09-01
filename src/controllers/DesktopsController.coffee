class DesktopsController extends Marionette.Controller
	initialize: ({
		@app
		@desktopSubset
		@desktopsCollection
	}) ->


	changeDesktop: (id) ->
		if not id
			desktop = @desktopsCollection.at 0
		else
			id = parseInt id, 10
			desktop = @desktopsCollection.get id

		if not desktop
			return

		@desktopSubset.setFilter (note) ->
			note.get('desktop_id') == id
		@desktopSubset.refresh()

		@app.vent.trigger 'change:desktop', desktop

