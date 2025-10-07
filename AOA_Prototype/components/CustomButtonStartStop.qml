import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Effects
import "../"

Button{
    id: idButton
    Theme{
        id: idTheme
    }
    property int buttonWidth: idButtonText.implicitWidth + (idTheme.ySpace * 2)
    property int buttonheight: idButtonText.implicitHeight + (idTheme.ySpace *2)
    property string buttonText: ""
    property int buttonIconSize: idTheme.buttonFontSize
    property color buttonIconcolor: idTheme.textColor
    property int textOpacity : 1
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
        text: idButton.buttonText
        opacity: idButton.textOpacity
        font.family: idTheme.buttonFontName
        font.pixelSize: idButton.buttonIconSize
        color: idButton.buttonIconcolor
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
