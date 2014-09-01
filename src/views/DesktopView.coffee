DesktopView = Backbone.Marionette.CollectionView.extend
	tagName: 'ul'
	getChildView: (item) ->
		if item.get('type') == 'image'
			return ImageNoteView
		TextNoteView
