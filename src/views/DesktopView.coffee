class DesktopView extends Backbone.Marionette.CollectionView
	tagName: 'ul'
	getChildView: (item) ->
		if item.get('type') == 'image'
			return ImageNoteView
		TextNoteView
