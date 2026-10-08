import QtQuick
import Quickshell.Networking
import qs.theme

BarLabel {
    readonly property var primary: {
        var devices = Networking.devices ? Networking.devices.values : []
        for (var i = 0; i < devices.length; i++) {
            var d = devices[i]
            if (d && d.connected)
                return d
        }
        return null
    }

    readonly property var wifiNetwork: {
        if (!primary || !primary.networks)
            return null
        var nets = primary.networks.values || []
        for (var j = 0; j < nets.length; j++) {
            if (nets[j] && nets[j].connected)
                return nets[j]
        }
        return null
    }

    readonly property bool isWifi: primary && primary.type === DeviceType.Wifi

    icon: {
        if (!primary)
            return "󰤭"
        if (isWifi && wifiNetwork)
            return "󰤨"
        if (primary.address)
            return "󰈀"
        return "󰤨"
    }

    caption: {
        if (!primary)
            return "Disconnected"
        if (isWifi && wifiNetwork)
            return wifiNetwork.name
        if (primary.address)
            return primary.address
        return primary.name
    }

    color: primary ? Theme.foreground : Theme.warning
}
