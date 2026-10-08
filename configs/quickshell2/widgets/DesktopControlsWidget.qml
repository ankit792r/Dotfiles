import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.Pipewire
import qs.services
import qs.theme

Item {
    id: root

    property bool popupOpen: false

    readonly property var sink: Pipewire.defaultAudioSink
    readonly property var source: Pipewire.defaultAudioSource
    readonly property var nodes: Pipewire.nodes ? Pipewire.nodes.values : []
    readonly property var outputAudio: sink ? sink.audio : null
    readonly property var inputAudio: source ? source.audio : null
    readonly property real outputVolume: outputAudio ? outputAudio.volume : 0
    readonly property bool outputMuted: outputAudio ? outputAudio.muted : false
    readonly property real inputVolume: inputAudio ? inputAudio.volume : 0
    readonly property bool inputMuted: inputAudio ? inputAudio.muted : false

    readonly property var audioSinks: root.popupOpen ? root.collectSinks() : []
    readonly property var audioSources: root.popupOpen ? root.collectSources() : []
    readonly property var audioStreams: root.popupOpen ? root.collectStreams() : []

    property int pipeRevision: 0

    implicitWidth: barFace.implicitWidth
    implicitHeight: Theme.barHeight

    function collectSinks() {
        void root.pipeRevision
        var list = []
        for (var i = 0; i < nodes.length; i++) {
            var n = nodes[i]
            if (!n || !n.isSink || n.isStream || !n.audio)
                continue
            if (String(n.name || "") === "quickshell")
                continue
            list.push(n)
        }
        list = root.dedupeNodes(list)
        list.sort(function (a, b) {
            return root.deviceLabel(a).localeCompare(root.deviceLabel(b))
        })
        if (sink) {
            var idx = list.indexOf(sink)
            if (idx > 0) {
                list.splice(idx, 1)
                list.unshift(sink)
            } else if (idx < 0) {
                list.unshift(sink)
            }
        }
        return list
    }

    function collectSources() {
        void root.pipeRevision
        var list = []
        for (var i = 0; i < nodes.length; i++) {
            var n = nodes[i]
            if (!n || n.isStream || n.isSink === true)
                continue
            if (!root.isAudioSource(n))
                continue
            if (String(n.name || "") === "quickshell")
                continue
            list.push(n)
        }
        list = root.dedupeNodes(list)
        list.sort(function (a, b) {
            return root.deviceLabel(a).localeCompare(root.deviceLabel(b))
        })
        if (source) {
            var idx = list.indexOf(source)
            if (idx > 0) {
                list.splice(idx, 1)
                list.unshift(source)
            } else if (idx < 0) {
                list.unshift(source)
            }
        }
        return list
    }

    function dedupeNodes(list) {
        var seen = {}
        var out = []
        for (var i = 0; i < list.length; i++) {
            var n = list[i]
            if (!n)
                continue
            var key = String(n.name || "") + "|" + String(n.description || "")
            if (seen[key])
                continue
            seen[key] = true
            out.push(n)
        }
        return out
    }

    function collectStreams() {
        void root.pipeRevision
        var list = []
        for (var i = 0; i < nodes.length; i++) {
            var n = nodes[i]
            if (!n || !n.isStream || !root.isPlaybackStream(n) || !n.audio)
                continue
            list.push(n)
        }
        return list
    }

    function isPlaybackStream(node) {
        if (!node || !node.isStream)
            return false
        if (node.isSink === true)
            return true
        var mediaClass = String(node.type || "")
        return mediaClass.indexOf("Stream/Output/Audio") !== -1
            || mediaClass.indexOf("AudioOutStream") !== -1
            || mediaClass.indexOf("Output") !== -1
    }

    function isAudioSource(node) {
        if (!node)
            return false
        if (node.audio)
            return true
        var mediaClass = String(node.type || "")
        return mediaClass.indexOf("Audio/Source") !== -1
            || mediaClass.indexOf("AudioSource") !== -1
            || mediaClass.indexOf("Source") !== -1
    }

    function deviceLabel(node) {
        if (!node)
            return ""
        var label = String(node.description || node.name || "Device")
        label = label.replace(/^sof-soundwire\s+/i, "")
        label = label.replace(/^built-?in audio\s+/i, "")
        label = label.replace(/\s+Output$/i, "")
        label = label.replace(/\s+Input$/i, "")
        return label.trim()
    }

    function streamLabel(node) {
        if (!node)
            return "Application"
        var props = node.properties || {}
        return props["application.name"] || node.description || node.name || "Application"
    }

    function setOutputVolume(v) {
        if (!outputAudio)
            return
        outputAudio.volume = Math.max(0, Math.min(1, v))
    }

    function setInputVolume(v) {
        if (!inputAudio)
            return
        inputAudio.volume = Math.max(0, Math.min(1, v))
    }

    function closePopup() {
        popupOpen = false
    }

    readonly property var trackedObjects: {
        void root.pipeRevision
        var list = []
        if (sink)
            list.push(sink)
        if (source)
            list.push(source)
        if (popupOpen) {
            for (var i = 0; i < audioSinks.length; i++)
                list.push(audioSinks[i])
            for (var j = 0; j < audioSources.length; j++)
                list.push(audioSources[j])
            for (var k = 0; k < audioStreams.length; k++)
                list.push(audioStreams[k])
        }
        return list
    }

    PwObjectTracker {
        objects: root.trackedObjects
    }

    Connections {
        target: Pipewire
        function onDefaultAudioSinkChanged() { root.pipeRevision++ }
        function onDefaultAudioSourceChanged() { root.pipeRevision++ }
    }

    onPopupOpenChanged: {
        if (popupOpen)
            Backlight.scheduleRefresh()
    }

    BarLabel {
        id: barFace
        anchors.centerIn: parent
        text: "󰍹"
    }

    MouseArea {
        anchors.fill: parent
        acceptedButtons: Qt.LeftButton | Qt.RightButton
        onClicked: function (mouse) {
            if (mouse.button === Qt.RightButton) {
                if (outputAudio)
                    outputAudio.muted = !outputAudio.muted
                return
            }
            root.popupOpen = !root.popupOpen
        }
        onWheel: function (wheel) {
            if (!outputAudio)
                return
            var step = wheel.angleDelta.y > 0 ? 0.05 : -0.05
            setOutputVolume(outputVolume + step)
        }
    }

    PopupWindow {
        id: popup
        visible: root.popupOpen
        grabFocus: root.popupOpen
        color: "transparent"
        implicitWidth: Theme.popupWidth
        implicitHeight: Math.min(560, popupCard.implicitHeight)

        onClosed: root.closePopup()

        anchor {
            id: popupAnchor
            window: root.QsWindow.window
            adjustment: PopupAdjustment.Slide
            edges: Edges.Top | Edges.Left
            gravity: Edges.Bottom | Edges.Right
            rect.width: 1
            rect.height: 1

            onAnchoring: {
                var window = root.QsWindow.window
                if (!window)
                    return

                var popupWidth = popup.implicitWidth
                var popupHeight = popup.implicitHeight
                var localX = root.width / 2 - popupWidth / 2
                var localY = root.height + Theme.modulePadding
                var point = window.contentItem.mapFromItem(root, localX, localY)
                point.x = Math.max(8, Math.min(point.x, window.width - popupWidth - 8))
                popupAnchor.rect.x = Math.round(point.x)
                popupAnchor.rect.y = Math.round(point.y)
            }
        }

        Rectangle {
            id: popupCard
            width: popup.implicitWidth
            implicitHeight: popupColumn.implicitHeight + Theme.popupPadding * 2
            radius: 0
            color: Theme.popupBackground
            border.color: Theme.popupBorder
            border.width: 1

            ScrollView {
                id: scroll
                anchors.fill: parent
                anchors.margins: Theme.popupPadding
                clip: true
                ScrollBar.horizontal.policy: ScrollBar.AlwaysOff
                ScrollBar.vertical.policy: ScrollBar.AsNeeded

                ColumnLayout {
                    id: popupColumn
                    width: scroll.availableWidth
                    spacing: 14

                    Text {
                        Layout.fillWidth: true
                        text: "Desktop controls"
                        font.family: Theme.fontFamily
                        font.pixelSize: Theme.fontSize + 2
                        font.weight: Font.Bold
                        color: Theme.foreground
                    }

                    Rectangle {
                        Layout.fillWidth: true
                        height: 1
                        color: Theme.popupBorder
                    }

                    // —— Output ——
                    MediaControlsSectionHeader {
                        Layout.fillWidth: true
                        title: "Output"
                        trailing: outputMuted ? "Muted" : Math.round(root.outputVolume * 100) + "%"
                    }

                    RowLayout {
                        Layout.fillWidth: true
                        spacing: 8

                        Text {
                            text: outputMuted ? "󰓄" : "󰓃"
                            font: Theme.barFont()
                            color: Theme.foreground

                            MouseArea {
                                anchors.fill: parent
                                cursorShape: Qt.PointingHandCursor
                                onClicked: {
                                    if (root.outputAudio)
                                        root.outputAudio.muted = !root.outputAudio.muted
                                }
                            }
                        }

                        ControlSlider {
                            Layout.fillWidth: true
                            minimum: 0
                            maximum: 1
                            step: 0.01
                            value: root.outputVolume
                            enabled: !!root.outputAudio
                            onMoved: function (v) { root.setOutputVolume(v) }
                        }
                    }

                    ColumnLayout {
                        Layout.fillWidth: true
                        spacing: 4
                        visible: root.audioSinks.length > 0

                        Repeater {
                            model: root.audioSinks

                            delegate: MediaDeviceRow {
                                required property var modelData
                                Layout.fillWidth: true
                                label: root.deviceLabel(modelData)
                                active: root.sink && modelData && modelData.id === root.sink.id
                                onClicked: Pipewire.preferredDefaultAudioSink = modelData
                            }
                        }
                    }

                    Rectangle {
                        Layout.fillWidth: true
                        height: 1
                        color: Theme.highlight
                        visible: root.audioSources.length > 0 || !!root.source
                    }

                    // —— Input ——
                    MediaControlsSectionHeader {
                        Layout.fillWidth: true
                        visible: root.audioSources.length > 0 || !!root.source
                        title: "Input"
                        trailing: inputMuted ? "Muted" : Math.round(root.inputVolume * 100) + "%"
                    }

                    RowLayout {
                        Layout.fillWidth: true
                        spacing: 8
                        visible: root.audioSources.length > 0 || !!root.source

                        Text {
                            text: inputMuted ? "󰍭" : "󰍬"
                            font: Theme.barFont()
                            color: Theme.foreground

                            MouseArea {
                                anchors.fill: parent
                                cursorShape: Qt.PointingHandCursor
                                onClicked: {
                                    if (root.inputAudio)
                                        root.inputAudio.muted = !root.inputAudio.muted
                                }
                            }
                        }

                        ControlSlider {
                            Layout.fillWidth: true
                            minimum: 0
                            maximum: 1
                            step: 0.01
                            value: root.inputVolume
                            enabled: !!root.inputAudio
                            onMoved: function (v) { root.setInputVolume(v) }
                        }
                    }

                    ColumnLayout {
                        Layout.fillWidth: true
                        spacing: 4
                        visible: root.audioSources.length > 0

                        Repeater {
                            model: root.audioSources

                            delegate: MediaDeviceRow {
                                required property var modelData
                                Layout.fillWidth: true
                                label: root.deviceLabel(modelData)
                                active: root.source && modelData && modelData.id === root.source.id
                                onClicked: Pipewire.preferredDefaultAudioSource = modelData
                            }
                        }
                    }

                    Rectangle {
                        Layout.fillWidth: true
                        height: 1
                        color: Theme.highlight
                        visible: root.audioStreams.length > 0
                    }

                    // —— Apps ——
                    MediaControlsSectionHeader {
                        Layout.fillWidth: true
                        visible: root.audioStreams.length > 0
                        title: "Applications"
                    }

                    ColumnLayout {
                        Layout.fillWidth: true
                        spacing: 8
                        visible: root.audioStreams.length > 0

                        Repeater {
                            model: root.audioStreams

                            delegate: ColumnLayout {
                                required property var modelData
                                Layout.fillWidth: true
                                spacing: 4

                                readonly property var streamAudio: modelData ? modelData.audio : null

                                Text {
                                    Layout.fillWidth: true
                                    text: root.streamLabel(modelData)
                                    font: Theme.barFont()
                                    color: Theme.foreground
                                    elide: Text.ElideRight
                                }

                                ControlSlider {
                                    Layout.fillWidth: true
                                    minimum: 0
                                    maximum: 1.5
                                    step: 0.01
                                    enabled: !!streamAudio
                                    value: streamAudio ? streamAudio.volume : 0
                                    onMoved: function (v) {
                                        if (streamAudio)
                                            streamAudio.volume = v
                                    }
                                }
                            }
                        }
                    }

                    Rectangle {
                        Layout.fillWidth: true
                        height: 1
                        color: Theme.highlight
                        visible: Backlight.available
                    }

                    // —— Brightness ——
                    MediaControlsSectionHeader {
                        Layout.fillWidth: true
                        visible: Backlight.available
                        title: "Brightness"
                        trailing: Backlight.percent + "%"
                    }

                    RowLayout {
                        Layout.fillWidth: true
                        spacing: 8
                        visible: Backlight.available

                        Text {
                            text: Backlight.percent <= 33 ? "󰃞" : (Backlight.percent <= 66 ? "󰃟" : "󰃠")
                            font: Theme.barFont()
                            color: Theme.foreground
                        }

                        ControlSlider {
                            Layout.fillWidth: true
                            minimum: 0
                            maximum: 100
                            step: 1
                            value: Backlight.percent
                            onMoved: function (v) { Backlight.setPercent(v) }
                        }
                    }
                }
            }
        }
    }
}
