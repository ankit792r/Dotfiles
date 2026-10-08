pragma Singleton
import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
    id: root

    property real cpuUsage: 0
    property real memoryUsedGiB: 0
    property int temperatureC: 0

    property var _prevCpu: null

    Timer {
        interval: 2000
        running: true
        repeat: true
        triggeredOnStart: true
        onTriggered: {
            cpuProc.running = true
            memProc.running = true
            tempProc.running = true
        }
    }

    Process {
        id: cpuProc
        command: ["sh", "-c", "read cpu a b c d e f g h i j < /proc/stat; echo $((a+b+c+d+e+f+g+h+i+j)) $a $b $c $d"]
        stdout: StdioCollector {
            onStreamFinished: {
                var parts = text.trim().split(/\s+/)
                if (parts.length < 6)
                    return
                var total = parseInt(parts[0])
                var idle = parseInt(parts[4])
                if (root._prevCpu) {
                    var dt = total - root._prevCpu.total
                    var di = idle - root._prevCpu.idle
                    if (dt > 0)
                        root.cpuUsage = Math.round(((dt - di) / dt) * 100)
                }
                root._prevCpu = { total: total, idle: idle }
            }
        }
    }

    Process {
        id: tempProc
        command: ["sh", "-c", "for z in /sys/class/thermal/thermal_zone*/temp; do [ -r \"$z\" ] && read t < \"$z\" && echo $((t/1000)) && break; done"]
        stdout: StdioCollector {
            onStreamFinished: {
                var v = parseInt(text.trim())
                if (!isNaN(v))
                    root.temperatureC = v
            }
        }
    }

    Process {
        id: memProc
        command: ["sh", "-c", "awk '/MemAvailable/ {avail=$2} /MemTotal/ {total=$2} END {printf \"%.2f\", (total-avail)/1024/1024}' /proc/meminfo"]
        stdout: StdioCollector {
            onStreamFinished: {
                var v = parseFloat(text.trim())
                if (!isNaN(v))
                    root.memoryUsedGiB = v
            }
        }
    }
}
