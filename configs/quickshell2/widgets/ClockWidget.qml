import QtQuick
import Quickshell.Io
import qs.theme

BarLabel {
    id: root

    property string clockText: ""

    text: clockText

    Timer {
        interval: 1000
        running: true
        repeat: true
        triggeredOnStart: true
        onTriggered: dateProc.running = true
    }

    Process {
        id: dateProc
        command: ["sh", "-c", "TZ=Asia/Kolkata date '+%I:%M %p'"]
        stdout: StdioCollector {
            onStreamFinished: {
                var t = text.trim()
                if (t)
                    root.clockText = t
            }
        }
    }
}
