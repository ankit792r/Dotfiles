import QtQuick
import QtQuick.Layouts
import Quickshell
import qs.theme

Scope {
    Variants {
        model: Quickshell.screens

        PanelWindow {
            required property var modelData

            screen: modelData
            implicitHeight: Theme.barHeight
            color: Theme.background

            anchors {
                top: true
                left: true
                right: true
            }

            Item {
                anchors.fill: parent

                RowLayout {
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                    spacing: 2

                    ClockWidget {}
                    Item { width: 2; height: 0 }
                    WorkspacesWidget {}
                    WindowTitleWidget {}
                }

                MprisWidget {
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                }

                RowLayout {
                    anchors.right: parent.right
                    anchors.verticalCenter: parent.verticalCenter
                    spacing: 0

                    DesktopControlsWidget {}
                    NetworkWidget {}
                    BluetoothWidget {}
                    CpuWidget {}
                    MemoryWidget {}
                    TemperatureWidget {}
                    BatteryWidget {}
                    TrayWidget {}
                }
            }
        }
    }
}
