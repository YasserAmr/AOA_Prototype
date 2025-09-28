import QtQuick
import QtQuick.Controls

ApplicationWindow {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    FontLoader{
        id: idFontLoader
        source: "./font/Free-Solid-900.otf"
    }
    Component.onCompleted: {
        console.log("Font name" + idFontLoader.name)
    }
}
