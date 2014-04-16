// Generated by CoffeeScript 1.7.1
var DesktopsController;

DesktopsController = Marionette.Controller.extend({
  initialize: function(_arg) {
    this.app = _arg.app, this.desktopSubset = _arg.desktopSubset, this.desktopCollection = _arg.desktopCollection, this.notesCollection = _arg.notesCollection, this.currentDesktopNotesCollection = _arg.currentDesktopNotesCollection;
  },
  changeDesktop: function(id) {
    var desktop;
    if (!id) {
      desktop = this.desktopCollection.at(0);
    } else {
      id = parseInt(id, 10);
      desktop = this.desktopCollection.get(id);
    }
    if (!desktop) {
      return;
    }
    this.app.currentDesktop = desktop;
    this.desktopSubset.setFilter(function(note) {
      return note.get('desktop_id') === id;
    });
    return this.desktopSubset.refresh();
  }
});
