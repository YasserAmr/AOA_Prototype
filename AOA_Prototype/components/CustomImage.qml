import QtQuick 2.15

Rectangle {
    id:idCustomImage
    property string imageIcon: "\uF77D"
    property int  xPosition: -50
    property int  yPosition: 20
    property int  imageSize: 500
    property color imageColor: idTheme.accentColor

    width: imageSize
    height: imageSize
    color: Qt.rgba(0,0,0,0)

    // x:xPosition
    // y:yPosition
    Text {
        anchors.centerIn: parent
        text: imageIcon
        font.family: idTheme.buttonFontName
        font.pixelSize: imageSize
        color: imageColor
    }
}
