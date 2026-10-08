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
        icon: {
            var p = Backlight.percent
            return p <= 33 ? "󰃞" : (p <= 66 ? "󰃟" : "󰃠")
        }
        caption: Backlight.percent + "%"
    }

    MouseArea {
        anchors.fill: parent
        acceptedButtons: Qt.NoButton
        onWheel: function (wheel) {
            Backlight.step(wheel.angleDelta.y > 0)
        }
    }
}
