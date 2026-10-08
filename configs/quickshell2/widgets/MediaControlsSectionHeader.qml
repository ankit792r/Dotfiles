import QtQuick
import QtQuick.Layouts
import qs.theme

RowLayout {
    property string title: ""
    property string trailing: ""

    Layout.fillWidth: true

    Text {
        text: title.toUpperCase()
        font.family: Theme.fontFamily
        font.pixelSize: Theme.fontSize - 2
        font.weight: Theme.fontWeight
        color: Theme.subtle
    }

    Item { Layout.fillWidth: true }

    Text {
        text: trailing
        font.family: Theme.fontFamily
        font.pixelSize: Theme.fontSize - 2
        font.weight: Theme.fontWeight
        color: Theme.subtle
    }
}
