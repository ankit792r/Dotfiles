pragma Singleton
import QtQuick
import Niri

Niri {
    Component.onCompleted: connect()

    onConnected: console.info("quickshell2: connected to niri")
    onErrorOccurred: function (error) {
        console.error("quickshell2: niri error:", error)
    }
}
