DesktopsMenuView = Backbone.Marionette.CollectionView.extend
	tagName: 'ul'
	attributes:
		# It sux that element's class must be set here
		#   but it is a limitation of backbone
		'class': 'side-nav'
	itemView: DesktopsMenuItemView
	itemViewOptions: ->
		currentDesktop: @options.currentDesktop