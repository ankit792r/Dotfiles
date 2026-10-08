import QtQuick
import qs.services
import qs.theme

BarLabel {
    readonly property int temp: SysInfo.temperatureC

    icon: {
        if (temp >= 80)
            return ""
        if (temp >= 70)
            return ""
        if (temp >= 60)
            return ""
        return ""
    }

    caption: temp + "°C"
    color: temp >= 80 ? Theme.warning : Theme.foreground
}
