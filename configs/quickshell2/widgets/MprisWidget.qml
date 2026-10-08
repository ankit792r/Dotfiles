import QtQuick
import Quickshell.Services.Mpris
import qs.theme

Item {
    id: root

    readonly property int maxTitleLength: 50

    readonly property var playerList: Mpris.players ? Mpris.players.values : []

    // Bump when any player metadata or playback state changes.
    property int playerEpoch: 0

    readonly property var activePlayer: {
        var epoch = playerEpoch
        void epoch

        var list = playerList
        for (var i = 0; i < list.length; i++) {
            var playing = list[i]
            if (playing && playing.isPlaying && playing.trackTitle)
                return playing
        }
        for (var j = 0; j < list.length; j++) {
            var idle = list[j]
            if (idle && idle.trackTitle)
                return idle
        }
        return null
    }

    readonly property bool isPaused: activePlayer
        && activePlayer.playbackState === MprisPlaybackState.Paused

    readonly property string displayTitle: {
        if (!activePlayer || !activePlayer.trackTitle)
            return ""
        var title = activePlayer.trackTitle
        if (title.length <= maxTitleLength)
            return title
        return title.substring(0, maxTitleLength - 3) + "..."
    }

    readonly property string playerIcon: {
        if (!activePlayer || isPaused)
            return ""
        var key = String(activePlayer.desktopEntry || activePlayer.dbusName || "").toLowerCase()
        if (key.indexOf("spotify") !== -1)
            return ""
        if (key.indexOf("mpv") !== -1)
            return "󰎆"
        if (key.indexOf("firefox") !== -1)
            return "󰈹"
        return "󰝚"
    }

    readonly property string statusIcon: isPaused ? "⏸" : ""

    visible: displayTitle !== ""
    implicitHeight: Theme.barHeight
    implicitWidth: visible ? row.implicitWidth + Theme.modulePadding * 2 : 0

    Instantiator {
        model: root.playerList
        delegate: Connections {
            required property var modelData
            target: modelData
            function onIsPlayingChanged() { root.playerEpoch++ }
            function onTrackTitleChanged() { root.playerEpoch++ }
            function onPlaybackStateChanged() { root.playerEpoch++ }
        }
    }

    Connections {
        target: Mpris.players
        function onValuesChanged() { root.playerEpoch++ }
    }

    Row {
        id: row
        anchors.centerIn: parent
        spacing: Theme.iconTextGap

        Text {
            visible: root.playerIcon !== ""
            text: root.playerIcon
            font: Theme.barFont()
            color: Theme.foreground
        }

        Text {
            visible: root.statusIcon !== ""
            text: root.statusIcon
            font: Theme.barFont()
            color: Theme.foreground
        }

        Text {
            text: root.displayTitle
            color: Theme.foreground
            font.family: Theme.fontFamily
            font.pixelSize: Theme.fontSize
            font.weight: Theme.fontWeight
            font.italic: root.isPaused
        }
    }
}
