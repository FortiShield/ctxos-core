import QtQuick 2.0
Image {
    id: root
    source: "/usr/share/backgrounds/ctxos/default-wallpaper.svg"
    fillMode: Image.PreserveAspectCrop
    
    Rectangle {
        id: progressBar
        color: "#c0caf5"
        height: 4
        width: root.width * 0.3
        y: root.height - 20
    }
    
    Text {
        text: "CtxOS 1.0.0"
        color: "#c0caf5"
        font.pixelSize: 32
        font.bold: true
        anchors.centerIn: parent
    }
}
