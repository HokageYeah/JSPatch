defineClass("ViewController", {
    tableView_didSelectRowAtIndexPath: function(tableView, indexPath) {
        if (self.dataSource().count() <= indexPath.row() || self.dataSourcesecond().count() <= indexPath.row()) {
            return;
        }
        var content = self.dataSource()[indexPath.row()];
        var contentsecond = self.dataSourcesecond()[indexPath.row()];
    }
}, {});
