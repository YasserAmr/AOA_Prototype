import QtQuick
import QtQuick.Controls
import "./components"
import AppBackend
ApplicationWindow {
    width: 1028
    height: 768
    visible: true
    title: qsTr("Hello World")

    FontLoader{
        id: idFontLoader
        source: "./font/Free-Solid-900.otf"
    }
    Component.onCompleted: {
        console.log("Font name" + idFontLoader.name)
    }

    Theme{
        id: idTheme
    }

    Backend {
        id: backend
    }

    StackView
    {
        id:idMainStackView
        anchors.fill: parent
        initialItem: "./FirstPage.qml"
    }
}
