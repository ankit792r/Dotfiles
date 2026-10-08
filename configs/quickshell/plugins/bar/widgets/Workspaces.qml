import QtQuick
import QtQuick.Layouts
import qs.Commons
import qs.Ui
import qs.services

BarWidget {
    id: root
    moduleName: "omarchy.workspaces"

    readonly property real trailingGap: root.vertical ? 0 : Style.spaceReal(1.5)
    readonly property int workspaceCount: NiriHost.workspaces ? NiriHost.workspaces.count : 0

    implicitWidth: grid.implicitWidth + trailingGap
    implicitHeight: grid.implicitHeight

    GridLayout {
        id: grid
        anchors.fill: parent
        anchors.rightMargin: root.trailingGap
        columns: root.vertical ? Math.max(1, root.workspaceCount) : Math.max(1, root.workspaceCount)
        columnSpacing: root.vertical ? 0 : Style.space(1)
        rowSpacing: root.vertical ? Style.space(2) : 0

        Repeater {
            model: NiriHost.workspaces

            WidgetButton {
                readonly property bool occupied: model.isActive
                readonly property bool focused: model.isFocused || model.isActive

                bar: root.bar
                text: model.name || String(model.index)
                opacity: occupied || focused ? 1 : 0.5
                horizontalMargin: 6
                verticalPadding: 6
                fixedWidth: root.vertical ? root.barSize : Style.space(20)
                fixedHeight: root.barSize
                onPressed: function () {
                    NiriHost.focusWorkspaceById(model.id)
                }
            }
        }
    }
}
