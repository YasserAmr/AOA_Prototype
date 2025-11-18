pragma ComponentBehavior: Bound
import QtQuick 2.15
import QtQuick.Layouts
import theme
import "../"

Item {
    id:idRoot
    Theme{
        id: idTheme
    }
    property var buttonModel: []
    property alias lableText: idCustomLable.text
    property string textIcon: "\u25D0"
    property int buttonIconSize: idTheme.buttonFontSize
    property color buttonIconcolor: idTheme.textColor
    property int groupeOpicity: 1
    property string groupeState: "light"
    property bool male: true


    implicitWidth: Math.max(idCustomLable.implicitWidth, buttonRow.implicitWidth)
    implicitHeight: idCustomLable.implicitHeight + buttonRow.implicitHeight + 10

    ColumnLayout {
        id: idlayout
        anchors.fill: parent
        CustomLable{
            id : idCustomLable
            Layout.fillWidth: true
            text: idRoot.lableText
            opacity: idRoot.groupeOpicity
            themeState: idRoot.groupeState
        }

        Row {
            id: buttonRow
            Layout.alignment: Qt.AlignHCenter
            spacing: 10
            Repeater {
                model: idRoot.buttonModel
                delegate: CustomButton {
                    required property var model
                    buttonIcon: model.icon
                    opacity: idRoot.groupeOpicity
                    state: idRoot.groupeState
                    buttonText:  model.text ? model.text : ""
                    buttonIconSize : model.buttonIconSize ? model.buttonIconSize : idTheme.buttonFontSize
                    // onClicked: {
                    //     idRoot.buttonModel = model.target
                    // }
                    onClicked: {
                        // Change another model if targetModel is defined
                        if (model.targetModel) {
                            idRoot.buttonModel = model.targetModel
                        }
                        if (model.onClick) model.onClick()
                    }
                }
            }
        }

    }
}
