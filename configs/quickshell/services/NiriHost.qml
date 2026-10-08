pragma Singleton
import QtQuick
import Niri

Niri {
    Component.onCompleted: connect()

    onConnected: console.info("shell: connected to niri")
    onErrorOccurred: function (error) {
        console.error("shell: niri error:", error)
    }
}
