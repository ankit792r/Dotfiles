import QtQuick
import qs.services
import qs.theme

Item {
    visible: Backlight.available
    implicitWidth: label.implicitWidth
    implicitHeight: Theme.barHeight

    BarLabel {
        id: label
        anchors.fill: parent
        readonly property int level: Backlight.percent
        icon: level <= 33 ? "󰃞" : (level <= 66 ? "󰃟" : "󰃠")
        caption: level + "%"
    }

    MouseArea {
        anchors.fill: parent
        acceptedButtons: Qt.NoButton
        onWheel: function (wheel) {
            Backlight.step(wheel.angleDelta.y > 0)
        }
    }
}
