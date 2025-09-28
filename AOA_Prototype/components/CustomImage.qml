import QtQuick 2.15

Rectangle {
    id:idCustomImage
    property string imageIcon: "\uF77D"
    property int  xPosition: -50
    property int  yPosition: 20
    property int  imageSize: 550
    property color  imageColor: idTheme.accentColor

    x:xPosition
    y:yPosition
    Text {
        anchors.fill: parent
        text: imageIcon
        font.family: idTheme.buttonFontName
        font.pixelSize: imageSize
        color: imageColor
    }

}
