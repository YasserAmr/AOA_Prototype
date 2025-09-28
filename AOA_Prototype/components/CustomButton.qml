import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Effects
Button{
    id: idButton

    property int buttonWidth: idTheme.minimalButtonWidth
    property int buttonheight: idTheme.minimalButtonHeight
    property string textIcon: "\u25D0"
    property int buttonIconSize: idTheme.minimalButtonHeight


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
        font.pixelSize: buttonIconSize - 20
        color: idTheme. textColor
    }




}
