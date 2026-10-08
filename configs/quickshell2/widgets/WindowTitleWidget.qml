import QtQuick
import qs.services
import qs.theme

Item {
    implicitHeight: Theme.barHeight
    implicitWidth: Math.min(title.implicitWidth + 16, 420)

    Text {
        id: title
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 8
        width: parent.width - 8
        text: NiriHost.focusedWindow?.title ?? ""
        font: Theme.barFont()
        color: Theme.foreground
        elide: Text.ElideRight
        maximumLineCount: 1
    }
}
