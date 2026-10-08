pragma Singleton
import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
    id: root

    property int percent: 0
    property bool available: false

    Timer {
        interval: 10000
        running: true
        repeat: true
        triggeredOnStart: true
        onTriggered: root.scheduleRefresh()
    }

    Timer {
        id: refreshDebounce
        interval: 120
        repeat: false
        onTriggered: root.runRefresh()
    }

    function scheduleRefresh() {
        refreshDebounce.restart()
    }

    function runRefresh() {
        readProc.running = false
        readProc.running = true
    }

    Process {
        id: readProc
        command: ["sh", "-c", "cur=$(brightnessctl get 2>/dev/null); max=$(brightnessctl max 2>/dev/null); echo \"$cur $max\""]
        stdout: StdioCollector {
            onStreamFinished: {
                var parts = text.trim().split(/\s+/)
                if (parts.length < 2)
                    return
                var cur = parseInt(parts[0])
                var max = parseInt(parts[1])
                if (isNaN(cur) || isNaN(max) || max <= 0)
                    return
                root.available = true
                root.percent = Math.round((cur / max) * 100)
            }
        }
        onExited: function (code) {
            if (code !== 0)
                root.available = false
        }
    }

    Process {
        id: stepProc
        command: ["brightnessctl", "set", "+1%"]
        onExited: root.scheduleRefresh()
    }

    function step(up) {
        stepProc.command = ["brightnessctl", "set", up ? "+1%" : "1%-"]
        stepProc.running = false
        stepProc.running = true
    }
}
