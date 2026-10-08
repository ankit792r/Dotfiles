import QtQuick
import qs.theme

Item {
    id: root

    // Single-line modules (clock, etc.)
    property string text: ""

    // Icon + value modules (tighter gap than between modules)
    property string icon: ""
    property string caption: ""

    property color color: Theme.foreground

    readonly property bool split: icon !== ""

    implicitHeight: Theme.barHeight
    implicitWidth: (split ? row.implicitWidth : label.implicitWidth) + Theme.modulePadding * 2

    Row {
        id: row
        anchors.centerIn: parent
        spacing: Theme.iconTextGap
        visible: root.split

        Text {
            text: root.icon
            font: Theme.barFont()
            color: root.color
        }

        Text {
            text: root.caption
            font: Theme.barFont()
            color: root.color
        }
    }

    Text {
        id: label
        anchors.centerIn: parent
        visible: !root.split
        text: root.text
        font: Theme.barFont()
        color: root.color
    }
}
