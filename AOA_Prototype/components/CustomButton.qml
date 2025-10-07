import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Effects
import "../"

Button{
    id: idButton
    Theme{
        id: idTheme
    }
    property int buttonWidth: Math.max(idButtonText.implicitWidth + idTheme.ySpace , idTheme.minimalButtonWidth)
    property int buttonheight: Math.max(idButtonText.implicitHeight + idTheme.ySpace, idTheme.minimalButtonHeight)
    property string buttonIcon: "\u25D0"
    property string buttonText: ""
    property int buttonIconSize: idTheme.buttonFontSize
    property color buttonIconcolor: idTheme.textColor

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
            color: idButton.buttonIconcolor
        }

        Rectangle {
            id:idRectangleButton
            anchors.fill: parent
            anchors.centerIn: parent
            border.color: idButton.buttonIconcolor
            radius: idTheme.cornarRadius
            color: idTheme.pageColor
        }
    }

    contentItem: Text {
        id: idButtonText
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        text: idButton.buttonIcon + idButton.buttonText
        font.family: idTheme.buttonFontName
        font.pixelSize: idButton.buttonIconSize
        //font.bold: true
        color: idButton.buttonIconcolor

    }

    states: [
        State {
            name: "dark"
            PropertyChanges {
                idRectangleButton.color: idTheme.textColor
            }

            PropertyChanges {
                idButton.buttonIconcolor: idTheme.pageColor
            }
        },

        State {
            name: "light"
            PropertyChanges {
                idRectangleButton.color: idTheme.pageColor
            }

            PropertyChanges {
                idButtonText.color: idTheme.textColor
            }
        }
    ]




}
