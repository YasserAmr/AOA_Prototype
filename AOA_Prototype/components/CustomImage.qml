import QtQuick 2.15

Rectangle {
    id:idCustomImage
    property string iconImage: "\uF77D"
    property int imageSize: 100
    Text {
        anchors.fill: parent
        text: iconImage
        font.family: idTheme.buttonFontName
        font.pixelSize: imageSize
    }

}
