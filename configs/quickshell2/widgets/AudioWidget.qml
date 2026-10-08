import QtQuick
import Quickshell.Services.Pipewire
import qs.theme

BarLabel {
    id: root

    readonly property var sink: Pipewire.defaultAudioSink
    readonly property var audio: sink ? sink.audio : null
    readonly property real sinkVolume: audio ? audio.volume : 0
    readonly property bool sinkMuted: audio ? audio.muted : false

    PwObjectTracker {
        objects: root.sink ? [root.sink] : []
    }

    Connections {
        target: Pipewire
        function onDefaultAudioSinkChanged() {
            root.sinkRevision++
        }
    }

    property int sinkRevision: 0

    icon: {
        void root.sinkRevision
        void root.sinkVolume
        void root.sinkMuted
        if (!audio)
            return "󰓃"
        return sinkMuted ? "󰓄" : "󰓃"
    }

    caption: {
        void root.sinkRevision
        void root.sinkVolume
        void root.sinkMuted
        if (!audio)
            return "—"
        if (sinkMuted)
            return "MUTED"
        return Theme.volumePercent(audio) + "%"
    }
}
