import Quickshell
import Quickshell.Services.SystemTray
import Quickshell.Wayland
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts

Text {
    id: clock
    anchors.horizontalCenter: parent.horizontalCenter
    Layout.alignment: Qt.AlignCenter

    color: root.colFg
    font {
        family: root.fontFamily
        pixelSize: root.fontSize
    }

    text: Qt.formatDateTime(new Date(), "HH\nMM")

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: clock.text = Qt.formatDateTime(new Date(), "HH\nMM")
    }
}
