import QtQuick
import qs.theme

Item {
    id: root

    property real value: 0
    property real minimum: 0
    property real maximum: 1
    property real step: 0.05
    property bool enabled: true
    property bool dragging: false
    property real liveValue: value

    signal moved(real value)

    implicitHeight: 22
    implicitWidth: 200

    readonly property real range: Math.max(0.0001, maximum - minimum)
    readonly property real progress: Math.max(0, Math.min(1, (liveValue - minimum) / range))

    onValueChanged: {
        if (!dragging)
            liveValue = value
    }

    Rectangle {
        id: track
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.right: parent.right
        height: 4
        radius: 0
        color: Theme.highlight
    }

    Rectangle {
        id: fill
        anchors.verticalCenter: track.verticalCenter
        anchors.left: track.left
        height: track.height
        width: track.width * root.progress
        radius: 0
        color: Theme.foreground

        Behavior on width {
            enabled: !root.dragging
            NumberAnimation { duration: 120; easing.type: Easing.OutCubic }
        }
    }

    Rectangle {
        id: knob
        width: 12
        height: 12
        radius: 0
        color: Theme.foreground
        border.color: Theme.background
        border.width: 1
        anchors.verticalCenter: track.verticalCenter
        x: Math.max(0, Math.min(track.width - width, track.width * root.progress - width / 2))
        scale: mouseArea.containsMouse || root.dragging ? 1.1 : 1.0

        Behavior on x {
            enabled: !root.dragging
            NumberAnimation { duration: 120; easing.type: Easing.OutCubic }
        }
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        enabled: root.enabled
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor
        opacity: root.enabled ? 1 : 0.45

        function valueFromX(x) {
            var clamped = Math.max(0, Math.min(track.width, x))
            return root.minimum + (clamped / track.width) * root.range
        }

        onPressed: function (mouse) {
            root.dragging = true
            var next = valueFromX(mouse.x)
            root.liveValue = next
            root.moved(next)
        }

        onPositionChanged: function (mouse) {
            if (!root.dragging)
                return
            var next = valueFromX(mouse.x)
            root.liveValue = next
            root.moved(next)
        }

        onReleased: {
            root.dragging = false
            root.liveValue = root.value
        }

        onWheel: function (wheel) {
            var delta = wheel.angleDelta.y > 0 ? root.step : -root.step
            var next = Math.max(root.minimum, Math.min(root.maximum, root.liveValue + delta))
            root.liveValue = next
            root.moved(next)
        }
    }
}
