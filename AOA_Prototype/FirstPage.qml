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



            CustomImage{
                id: idCustomImage
                anchors.bottom: parent.bottom
                anchors.top: idStartStop.bottom
            }


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
                opacity: 1
                visible: opacity
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
                opacity: 1
                visible: opacity
                spacing: 5
                Text { text: qsTr("Age groupe:") }
                Row{
                    id: idRow3
                    spacing: idTheme.xSpace
                    CustomButton{
                        id:idBaby
                        textIcon: "\uF77C"
                        onClicked: {
                            idCustomImage.imageIcon = "\uF77D"
                            idCustomImage.imageColor = idTheme.accentColor
                        }
                    }
                    CustomButton{
                        id:idYoung
                        textIcon: "\uF1AE"
                        onClicked: {
                            idCustomImage.imageIcon = "\uF1E3"
                            idCustomImage.imageColor = idTheme.accentColor
                        }
                    }
                    CustomButton{
                        id:idAdult
                        textIcon: "\uF183"
                        onClicked: {
                            idCustomImage.imageIcon = "\uF604"
                            idCustomImage.imageColor = idTheme.accentColor
                        }
                    }
                    CustomButton{
                        id: idOld
                        textIcon: "\uE53C"
                        onClicked: {
                            idCustomImage.imageIcon = "\uF06C" //Todo: check icone code
                            idCustomImage.imageColor = idTheme.accentColor
                        }
                    }

                }

            }

            CustomButton2{
                id: idStartStop
                textIcon: "Start handling "+ "\uF0DA" //toDo: Add Icon Size
                state: "stop"

                onClicked: {
                    if(state ==="stop" )
                    {
                        state ="start"
                        console.log("state = start ")
                    }
                    else
                    {
                        state ="stop"
                        console.log("state = stop ")
                    }
                }

                states: [
                    State {
                        name: "start"
                        PropertyChanges {target: idFirstSupColumn; opacity: 0 }
                        PropertyChanges {target: idSupColumn2;opacity: 0 }

                        PropertyChanges {target: idCustomImage; scale: 1 }

                    },
                    State {
                        name: "stop"
                        PropertyChanges {target: idFirstSupColumn; opacity: 1 }
                        PropertyChanges {target: idSupColumn2;opacity: 1 }
                        PropertyChanges {target: idCustomImage; scale: 1 }

                    }

                ]

                transitions: [
                    Transition {
                        from: "stop"
                        to: "start"
                        SequentialAnimation{
                            loops: Animation.Infinite
                            NumberAnimation { target: idCustomImage; property: "scale"; from:1; to: 1.5; duration: 1000 }
                            PauseAnimation {
                                duration: 500
                            }
                            NumberAnimation { target: idCustomImage; property: "scale"; from: 1.5; to:1 ; duration: 1000 }
                            PauseAnimation {
                                duration: 2000
                            }
                        }
                        NumberAnimation{properties: "opacity"; duration: 2000; easing.type: Easing.InOutQuad}
                    },
                    Transition {
                        from: "start"
                        to: "stop"
                        NumberAnimation{properties: "opacity"; duration: 2000; easing.type: Easing.InOutQuad}

                    }
                ]
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
