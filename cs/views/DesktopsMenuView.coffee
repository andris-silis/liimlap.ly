DesktopsMenuView = Backbone.Marionette.CollectionView.extend
	tagName: 'ul'
	itemView: DesktopsMenuItemView
	itemViewOptions: ->
		currentDesktop: @options.currentDesktop