import QtQuick
import QtQuick.Controls
import "./components"

Rectangle{
    id: idMainRectangle
    anchors.fill: parent
    color: idTheme.pageColor

    Rectangle{
        id:idLeftRectangle
        anchors.left: parent.left
        height: parent.height
        width: parent.width/2
        color: Qt.rgba(0,0,0,0)

        Column{
            id: idMainColumn
            anchors.fill: parent
            anchors.topMargin: idTheme.ySpace
            anchors.leftMargin: idTheme.ySpace
            spacing: idTheme.ySpace

            Row{
                id: idFirstRow
                spacing: idTheme.xSpace
                CustomButton{
                    textIcon: "\uF015" // Todo: check icon value
                }

                CustomButton{
                    textIcon: "\u25D0" // Todo: check icon value
                }

            }

            Column{
                id: idFirstSupColumn
                spacing: 5
                Text { text: qsTr("Favourit Planit:") }
                Row{
                    id: idSecondRow
                    spacing: idTheme.xSpace
                    CustomButton{
                        id: idMale
                        textIcon: "\uF222" // Todo: check icon value
                        onClicked: {
                            idYoung.textIcon = "\uF1AE"
                            idAdult.textIcon = "\uF183"
                        }
                    }

                    CustomButton{
                        id: idfemale
                        textIcon: "\uF221"
                        onClicked: {
                            idYoung.textIcon = "\uE59C"
                            idAdult.textIcon = "\uF182"
                        }
                    }


                }

            }

            Column{
                id: idSupColumn2
                spacing: 5
                Text { text: qsTr("Age groupe:") }
                Row{
                    id: idRow3
                    spacing: idTheme.xSpace
                    CustomButton{
                        id:idBaby
                        textIcon: "\uF77C"
                    }
                    CustomButton{
                        id:idYoung
                        textIcon: "\uF1AE"
                    }
                    CustomButton{
                        id:idAdult
                        textIcon: "\uF183"
                    }
                    CustomButton{
                        id: idOld
                        textIcon: "\uE53C"
                    }

                }

            }

        }

    }

    Rectangle{
        id:idRightRectangle
        anchors.right: parent.right
        height: parent.height
        width: parent.width/2
        color: Qt.rgba(0,0,0,0)
    }

}
