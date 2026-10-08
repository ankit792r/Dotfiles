import QtQuick
import Quickshell.Bluetooth
import qs.theme

BarLabel {
    readonly property var adapter: Bluetooth.defaultAdapter

    readonly property var connectedDevice: {
        var list = Bluetooth.devices ? Bluetooth.devices.values : []
        for (var i = 0; i < list.length; i++) {
            var d = list[i]
            if (d && d.connected)
                return d
        }
        return null
    }

    icon: ""
    caption: {
        if (!adapter || !adapter.enabled)
            return "OFF"
        if (connectedDevice)
            return connectedDevice.alias || connectedDevice.name || "device"
        return "on"
    }
}
