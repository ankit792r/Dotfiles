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

            RowLayout {
                anchors.fill: parent
                spacing: 0

                RowLayout {
                    spacing: 2
                    ClockWidget {}
                    Item { width: 2; height: 0 }
                    WorkspacesWidget {}
                    WindowTitleWidget {}
                }

                Item { Layout.fillWidth: true }

                RowLayout {
                    spacing: 0
                    Layout.alignment: Qt.AlignVCenter
                    AudioWidget {}
                    BacklightWidget {}
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
