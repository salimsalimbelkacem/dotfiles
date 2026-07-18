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
        model: SystemTray.items

        Rectangle {
            width: 15
            height: 15
            color: "transparent"

            Image {
                anchors.fill: parent
                source: modelData.icon
                mipmap: true
            }

            MouseArea {
                anchors.fill: parent
                onClicked: (mouse) => {
                    if (mouse.button === Qt.LeftButton) modelData.activate()
                    else modelData.display(null, 0, 0)
                }
                onWheel: (wheel) => modelData.scroll(wheel.angleDelta.y, false)
            }
        }
    }
}
