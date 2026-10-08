import QtQuick
import qs.theme

Rectangle {
    id: root

    property string label: ""
    property bool active: false

    signal clicked()

    implicitHeight: row.implicitHeight + 10
    radius: 0
    color: active ? Theme.highlight : "transparent"
    border.width: active ? 1 : 0
    border.color: Theme.popupBorder

    Row {
        id: row
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
        anchors.leftMargin: 8
        anchors.rightMargin: 8
        spacing: 8

        Text {
            text: active ? "●" : "○"
            font: Theme.barFont()
            color: active ? Theme.success : Theme.subtle
        }

        Text {
            width: parent.width - 24
            text: root.label
            font: Theme.barFont()
            color: Theme.foreground
            elide: Text.ElideRight
        }
    }

    MouseArea {
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        onClicked: root.clicked()
    }
}
