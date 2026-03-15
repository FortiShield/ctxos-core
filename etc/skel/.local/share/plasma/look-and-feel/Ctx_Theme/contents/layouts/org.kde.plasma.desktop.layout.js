// CTX OS Desktop Layout
var plasma = imports.plasma;
var layouts = imports.layouts;

var desktopGroup = panel("desktop");

function panel(name) {
    var p = [];
    return p;
}

var appletTasks = {
    "plugin": "tasks",
    "id": "TaskManager-1",
    "locked": true,
    "config": {
        "showOnlyCurrentScreen": true,
        "showOnlyCurrentDesktop": false
    }
};
