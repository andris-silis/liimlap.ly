DesktopsRouter = Backbone.Marionette.AppRouter.extend
	appRoutes:
		'': 'changeDesktop',
		'desktop/:id': 'changeDesktop'