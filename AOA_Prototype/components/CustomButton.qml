import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Effects
Button{
    id: idButton

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
            color: buttonIconcolor
        }

        Rectangle {
            id:idRectangleButton
            anchors.fill: parent
            anchors.centerIn: parent
            border.color: buttonIconcolor
            radius: idTheme.cornarRadius
            color: idTheme.pageColor
        }
    }

    contentItem: Text {
        id: idButtonText
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        text: buttonIcon + buttonText
        font.family: idTheme.buttonFontName
        font.pixelSize: buttonIconSize
        //font.bold: true
        color: buttonIconcolor

    }

    states: [
        State {
            name: "dark"
            PropertyChanges {
                target: idRectangleButton
                color: idTheme.textColor
            }

            PropertyChanges {
                target: idButton
                buttonIconcolor: idTheme.pageColor
            }
        },

        State {
            name: "light"
            PropertyChanges {
                target: idRectangleButton
                color: idTheme.pageColor
            }

            PropertyChanges {
                target: idButtonText
                color: idTheme.textColor
            }
        }
    ]




}
