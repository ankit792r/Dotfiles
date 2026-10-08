import QtQuick
import Quickshell.Services.Pipewire
import qs.theme

BarLabel {
    readonly property var sink: Pipewire.defaultAudioSink
    readonly property var audio: sink ? sink.audio : null

    icon: audio ? (audio.muted ? "󰓄" : "󰓃") : "󰓃"
    caption: {
        if (!audio)
            return "—"
        if (audio.muted)
            return "MUTED"
        return Theme.volumePercent(audio) + "%"
    }
}
