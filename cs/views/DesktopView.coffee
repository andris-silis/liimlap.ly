DesktopView = Backbone.Marionette.CollectionView.extend
	tagName: 'ul'
	getItemView: (item) ->
		if item.get('type') == 'image'
			return ImageNoteView
		TextNoteView
