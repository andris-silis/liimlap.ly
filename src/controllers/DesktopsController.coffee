class DesktopsController extends Marionette.Controller
	initialize: ({
		@app
		@desktopSubset
		@desktopCollection
	}) ->


	changeDesktop: (id) ->
		if not id
			desktop = @desktopCollection.at 0
		else
			id = parseInt id, 10
			desktop = @desktopCollection.get id

		if not desktop
			return

		@app.currentDesktop = desktop

		@desktopSubset.setFilter (note) ->
			note.get('desktop_id') == id
		@desktopSubset.refresh()

		@app.vent.trigger 'change:desktop', desktop

