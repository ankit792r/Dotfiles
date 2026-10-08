pragma Singleton
import QtQuick

QtObject {
    readonly property color background: Qt.rgba(20 / 255, 20 / 255, 21 / 255, 0.8)
    readonly property color foreground: Qt.rgba(198 / 255, 198 / 255, 198 / 255, 0.8)
    readonly property color subtle: "#606079"
    readonly property color highlight: "#323437"
    readonly property color warning: "#d8647e"

    readonly property int barHeight: 30
    readonly property int modulePadding: 6

    readonly property string fontFamily: "Iosevka Nerd Font"
    readonly property int fontSize: 16
    readonly property int fontWeight: Font.Bold

    function barFont() {
        return Qt.font({
            family: fontFamily,
            pixelSize: fontSize,
            weight: fontWeight
        })
    }
}
