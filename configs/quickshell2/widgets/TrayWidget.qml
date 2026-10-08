import QtQuick
import Quickshell.Services.SystemTray
import Quickshell.Widgets
import qs.theme

Item {
    id: root

    implicitHeight: Theme.barHeight
    implicitWidth: row.implicitWidth + Theme.modulePadding * 2

    Row {
        id: row
        anchors.centerIn: parent
        spacing: 5

        Repeater {
            model: SystemTray.items

            Item {
                required property var modelData

                width: 18
                height: Theme.barHeight

                IconImage {
                    anchors.centerIn: parent
                    width: 16
                    height: 16
                    source: modelData.icon
                }

                MouseArea {
                    anchors.fill: parent
                    acceptedButtons: Qt.LeftButton | Qt.RightButton
                    onClicked: function (mouse) {
                        if (mouse.button === Qt.LeftButton)
                            modelData.activate()
                        else if (mouse.button === Qt.RightButton && modelData.hasMenu)
                            modelData.display(null, 0, height)
                    }
                }
            }
        }
    }
}
