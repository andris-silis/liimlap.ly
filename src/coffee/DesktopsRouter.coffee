class DesktopsRouter extends Backbone.Marionette.AppRouter
	appRoutes:
		'': 'changeDesktop',
		'desktop/:id': 'changeDesktop'