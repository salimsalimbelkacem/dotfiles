import Quickshell.Hyprland
import QtQuick

Text {
    anchors.horizontalCenter: parent.horizontalCenter
    color: root.colFg
    font {
        family: root.fontFamily
        pixelSize: root.fontSize - 2
    }

    property string currentLayout: "[]="

    readonly property var layoutMap: ({
        "master":  "[]=",
        "monocle": "[M]"
    })

    text: currentLayout

    Connections {
        target: Hyprland
        function onRawEvent(event) {
            if (event.name !== "custom") return

            const args = event.parse(2)
            if (args.length < 2 && args[0] != "layout") return

            currentLayout = layoutMap[args[1]]
        }
    }
}
