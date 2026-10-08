import QtQuick
import qs.services
import qs.theme

BarLabel {
    icon: ""
    caption: Number(SysInfo.memoryUsedGiB).toFixed(2) + "GiB"
}
