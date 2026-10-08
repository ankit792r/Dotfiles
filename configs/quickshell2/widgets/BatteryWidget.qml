import QtQuick
import Quickshell.Services.UPower
import qs.theme

BarLabel {
    readonly property var device: UPower.displayDevice
    visible: device && device.isPresent && device.isLaptopBattery

    readonly property int capacity: device ? Math.round(device.percentage * 100) : 0
    readonly property bool charging: device && (device.state === UPowerDeviceState.Charging
                                                || device.state === UPowerDeviceState.PendingCharge)

    icon: {
        if (charging)
            return "󰂄"
        var step = Math.max(0, Math.min(9, Math.floor(capacity / 10)))
        var icons = ["󰁺", "󰁻", "󰁼", "󰁽", "󰁾", "󰁿", "󰂀", "󰂁", "󰂂", "󰁹"]
        return icons[step]
    }

    caption: capacity + "%"

    color: {
        if (charging)
            return Theme.success
        if (capacity <= 20)
            return Theme.warning
        if (capacity <= 30)
            return Theme.warning
        return Theme.foreground
    }
}
