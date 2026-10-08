import QtQuick
import Quickshell
import qs.widgets

ShellRoot {
    LazyLoader {
        active: true
        component: Bar {}
    }
}
