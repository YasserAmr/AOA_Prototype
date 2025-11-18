import QtQuick
import QtQuick.Controls
//import "./components"
// import AppBackend 1.0
import theme


ApplicationWindow {
    width: 1028
    height: 768

    minimumWidth: 1028
    maximumWidth: 1028
    minimumHeight: 768
    maximumHeight: 768

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

    // Backend{
    //     id: backend
    // }

    StackView
    {
        id:idMainStackView
        anchors.fill: parent
        initialItem: "./FirstPage.qml"
    }
}
