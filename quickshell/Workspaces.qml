import Quickshell
import Quickshell.Services.SystemTray
import Quickshell.Wayland
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts

Column {
    anchors.horizontalCenter: parent.horizontalCenter
    Layout.alignment: Qt.AlignCenter
    spacing: 5

    Repeater {
        model: 10

        Rectangle {
            width:  15
            height: 15
            radius: 10


            property var ws: Hyprland.workspaces.values.find(w => w.id === index + 1)
            property bool isActive: Hyprland.focusedWorkspace?.id === (index + 1)

            color: isActive ? root.colFg : "transparent"

            border {
                color: isActive || ws ? root.colFg : root.colFgDark 
                width: isActive ? 0 : 3
            }

            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                onClicked: Hyprland.dispatch("hl.dsp.focus({
                    workspace = " + (index + 1) + " })")
            }
        }
    }
}
