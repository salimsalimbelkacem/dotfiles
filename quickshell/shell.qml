import Quickshell
import Quickshell.Services.SystemTray
import Quickshell.Wayland
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts

PanelWindow {
    id: root
    property color colFgDark: "#54546D"
    property color colFg: "#C8C093"
    property string fontFamily: "JetBrainsMono Nerd Font"
    property int fontSize: 14

    anchors { top: true; left: true; bottom: true }

    implicitWidth: 30
    // width: 30

    color: Qt.rgba(31/255, 31/255, 40/255, 0.9)

    visible: true

    ColumnLayout {
        anchors {
            fill: parent
            topMargin: 10
            bottomMargin: 10
        }
        spacing: 5

        Workspaces {}
        Item { Layout.fillHeight:true }
        Tray {}
        Netw {}
        Layouts {}
        Clock {}

    }
}

