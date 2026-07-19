import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland
import Quickshell.Networking

Text {
    color: root.colFg
    Layout.alignment: Qt.AlignCenter

    font {
        family: root.fontFamily
        pixelSize: root.fontSize + 4
    }

    readonly property var wifiIcons: [ "󰤯", "󰤟", "󰤢", "󰤥", "󰤨"]  
    // readonly property var wifiIcons: [ "󰣾", "󰣴", "󰣶", "󰣸", "󰣺"]  
    readonly property var wifi_device: Networking.devices.values[1]
    readonly property var wifi_networks: wifi_device.networks.values

    function displayIcon(){
        if (wifi_networks[0].connected)
            return wifiIcons[
                Math.round(
                    wifi_networks[0]
                    .signalStrength * 4)]
        else return "󰤭"
        // else return "󰣼"
    }

    text: displayIcon()

    // MouseArea {
    //     anchors.fill: parent
    //     cursorShape: Qt.PointingHandCursor
    // }
}
