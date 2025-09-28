import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Effects
Button{
    id: idButton

    property int buttonWidth: idButtonText.implicitWidth + (idTheme.ySpace * 2)
    property int buttonheight: idButtonText.implicitHeight + (idTheme.ySpace *2)
    property string textIcon: "\u25D0"
    property int buttonIconSize: idTheme.buttonFontSize


    width: buttonWidth
    height: buttonheight

    background: Item {
        id: name
        RectangularShadow{
            anchors.fill: idRectangleButton
            offset.x: 1
            offset.y: 4
            radius: idTheme.cornarRadius
            blur: 0
            spread: 0
        }

        Rectangle {
            id:idRectangleButton
            anchors.fill: parent
            anchors.centerIn: parent
            border.color: idTheme. textColor
            radius: idTheme.cornarRadius

        }
    }

    contentItem: Text {
        id: idButtonText
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        text: textIcon
        font.family: idTheme.lableFontName
        font.pixelSize: buttonIconSize
        color: idTheme. textColor
    }




}
