import QtQuick
import QtQuick.Layouts
import qs.services
import qs.theme

Row {
    spacing: 0
    height: Theme.barHeight

    Repeater {
        model: NiriHost.workspaces

        Item {
            implicitWidth: label.implicitWidth + 14
            implicitHeight: Theme.barHeight

            Text {
                id: label
                anchors.centerIn: parent
                text: model.name || String(model.index)
                font: Theme.barFont()
                color: model.isUrgent ? Theme.warning
                                     : (model.isFocused || model.isActive ? Theme.foreground : Theme.subtle)
            }

            Rectangle {
                anchors.bottom: parent.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                width: label.implicitWidth + 14
                height: 3
                visible: model.isFocused || model.isActive || model.isUrgent
                color: model.isUrgent ? Theme.warning : Theme.foreground
            }

            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                onClicked: NiriHost.focusWorkspaceById(model.id)
            }
        }
    }
}
