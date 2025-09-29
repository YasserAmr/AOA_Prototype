import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Layouts

Item {
    id:idRoot
    property var buttonModel: []
    property alias text: idCustomLable.text
    // property int buttonWidth: Math.max(idTheme.minimalButtonWidth, idlayout.implicitWidth)
    // property int buttonheight: Math.max( idTheme.minimalButtonHeight, idlayout.implicitHeight)
    property string textIcon: "\u25D0"
    property int buttonIconSize: idTheme.minimalButtonHeight
    property color buttonIconcolor: idTheme.textColor
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
            text: text
            themeState: groupeState
        }

        Row {
            id: buttonRow
            Layout.alignment: Qt.AlignHCenter
            spacing: 10
            Repeater {
                model: idRoot.buttonModel
                delegate: CustomButton {
                    textIcon: model.icon
                    state: groupeState
                    onClicked: {
                        // Change another model if targetModel is defined
                        if (model.targetModel) {
                            idRoot.buttonModel = model.targetModel
                        }
                        // Call onClick if defined
                        if (model.onClick) model.onClick()
                    }
                }
            }
        }

    }
}
