import QtQuick 2.15
import QtQuick.Controls

Button{
    id: idButton

    property int buttonWidth: idTheme.minimalButtonWidth
    property int buttonheight: idTheme.minimalButtonHeaght
    property string textIcon: "\u25D0"

    width: buttonWidth
    height: buttonheight

    background: Rectangle {
        id:idRectangleButton
        anchors.fill: parent
        anchors.centerIn: parent
        border.color: idTheme. textColor
        radius: idTheme.cornarRadius
    }

    contentItem: Text {
        id: idButtonText
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        text: textIcon
        font.family: idTheme.lableFontName
        font.pixelSize: idTheme.buttonFontSize
        color: idTheme. textColor
    }




}
