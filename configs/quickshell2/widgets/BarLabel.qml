import QtQuick
import qs.theme

Item {
    id: root

    property alias text: label.text
    property color color: Theme.foreground

    implicitHeight: Theme.barHeight
    implicitWidth: label.implicitWidth + Theme.modulePadding * 2

    Text {
        id: label
        anchors.centerIn: parent
        font: Theme.barFont()
        color: root.color
    }
}
