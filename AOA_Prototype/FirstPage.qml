import QtQuick
import QtQuick.Controls
import "./components"

Rectangle{
    id: idMainRectangle
    anchors.fill: parent
    color: idTheme.pageColor
    state: "light"
    states: [
        State {
            name: "dark"
            PropertyChanges {
                target: idMainRectangle
                color: idTheme.textColor
            }
        },

        State {
            name: "light"
            PropertyChanges {
                target: idMainRectangle
                color: idTheme.pageColor
            }
        }
    ]

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
                id: idCustomImageLeft
                anchors.bottom: parent.bottom
                anchors.top: idStartStop.bottom
            }


            Row{
                id: idFirstRow
                spacing: idTheme.xSpace
                CustomButton{
                    id:idPowerButton
                    textIcon: "\uF015" // Todo: check icon value
                    onClicked: {
                        Qt.quit()
                    }
                }

                CustomButton{
                    id:idPThemeButton
                    textIcon: "\u25D0"
                    state: "light"
                    onClicked: {
                        if (state === "dark")
                        {
                            state = "light"
                            idMainRectangle.state = "light"
                            idPowerButton.state= "light"
                            idMale.state= "light"
                            idfemale.state= "light"
                            idBaby.state= "light"
                            idYoung.state= "light"
                            idAdult.state= "light"
                            idOld.state= "light"
                            idStartStop.state= "light"
                            idFavouritPlanit.state= "light"
                            idAgegroupe.state= "light"
                            console.log("state = light")
                        }
                        else
                        {
                            state = "dark"
                            idMainRectangle.state = "dark"
                            idPowerButton.state= "dark"
                            idMale.state= "dark"
                            idfemale.state= "dark"
                            idBaby.state= "dark"
                            idYoung.state= "dark"
                            idAdult.state= "dark"
                            idOld.state= "dark"
                            idStartStop.state= "dark"
                            idFavouritPlanit.state= "dark"
                            idAgegroupe.state= "dark"
                            console.log("state = dark")
                        }
                    }
                }

            }

            Column{
                id: idFirstSupColumn
                opacity: 1
                visible: opacity
                spacing: 5
                state: "light"
                Text {
                    id : idFavouritPlanit
                    text: qsTr("Favourit Planit:")
                    font.pixelSize: idTheme.lableFontSize
                    color: idTheme.textColor
                    states: [
                        State {
                            name: "dark"
                            PropertyChanges {
                                target: idFavouritPlanit
                                color: idTheme.pageColor
                            }
                        },

                        State {
                            name: "light"
                            PropertyChanges {
                                target: idFavouritPlanit
                                color: idTheme.textColor
                            }
                        }
                    ]
                }
                Row{
                    id: idSecondRow
                    spacing: idTheme.xSpace
                    CustomButton{
                        id: idMale
                        textIcon: "\uF222"
                        state: "light"
                        onClicked: {
                            idYoung.textIcon = "\uF1AE"
                            idAdult.textIcon = "\uF183"
                        }
                    }

                    CustomButton{
                        id: idfemale
                        textIcon: "\uF221"
                        state: "light"
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
                Text {
                    id: idAgegroupe
                    text: qsTr("Age groupe:")
                    font.pixelSize: idTheme.lableFontSize
                    color: idTheme.textColor
                    states: [
                        State {
                            name: "dark"
                            PropertyChanges {
                                target: idAgegroupe
                                color: idTheme.pageColor
                            }
                        },

                        State {
                            name: "light"
                            PropertyChanges {
                                target: idAgegroupe
                                color: idTheme.textColor
                            }
                        }
                    ]
                }
                Row{
                    id: idRow3
                    spacing: idTheme.xSpace
                    CustomButton{
                        id:idBaby
                        textIcon: "\uF77C"
                        state: "light"
                        onClicked: {
                            idCustomImageLeft.imageIcon = "\uF77D"
                            idCustomImageLeft.imageColor = idTheme.accentColor
                        }
                    }
                    CustomButton{
                        id:idYoung
                        textIcon: "\uF1AE"
                        state: "light"
                        onClicked: {
                            idCustomImageLeft.imageIcon = "\uF1E3"
                            idCustomImageLeft.imageColor = idTheme.accentColor
                        }
                    }
                    CustomButton{
                        id:idAdult
                        textIcon: "\uF183"
                        state: "light"
                        onClicked: {
                            idCustomImageLeft.imageIcon = "\uF604"
                            idCustomImageLeft.imageColor = idTheme.accentColor
                        }
                    }
                    CustomButton{
                        id: idOld
                        textIcon: "\uE53C"
                        state: "light"
                        onClicked: {
                            idCustomImageLeft.imageIcon = "\uF06C" //Todo: check icone code
                            idCustomImageLeft.imageColor = idTheme.accentColor
                        }
                    }

                }

            }

            CustomButton2{
                id: idStartStop
                textIcon: "Start handling "+ "\uF0DA" //toDo: Add Icon Size
                state: "stop"

                // onClicked: {
                //     if(state ==="stop" )
                //     {
                //         state ="start"
                //         console.log("state = start ")
                //     }
                //     else
                //     {
                //         state ="stop"
                //         console.log("state = stop ")
                //     }
                // }

                states: [
                    State {
                        name: "start"
                        PropertyChanges { target: idSupColumn2;  opacity: 0 }
                        PropertyChanges { target: idFirstSupColumn; opacity: 0 }
                        PropertyChanges { target: idStartStop; y: 95 }
                        // PropertyChanges { target: idStartStop; textIcon: "stop " + "\uF256" }
                        //AnchorChanges { target: idStartStop; anchors.top: idFirstRow.bottom
                        PropertyChanges { target: idCustomImageLeft; scale: 1 }
                        //PropertyChanges { target: idCustomImageLeft; x: 100 }

                    },
                    State {
                        name: "stop"
                        PropertyChanges { target: idSupColumn2;  opacity: 1 }
                        PropertyChanges { target: idFirstSupColumn; opacity: 1 }
                        PropertyChanges { target: idStartStop; y: 320 }
                        PropertyChanges { target: idStartStop; textIcon: "Start Healing " + "\uF0DA" }
                        //AnchorChanges { target: idStartStop; anchors.top: idSupColumn2.bottom }
                        PropertyChanges { target: idCustomImageLeft; scale: 1 }
                    }
                ]

                transitions: [
                    Transition {
                        from: "start"; to: "stop"
                        // NumberAnimation { properties: "opacity", textIcon; duration: 2000; easing.type: Easing.InOutQuad }
                        NumberAnimation { properties: "y"; duration: 2000; easing.type: Easing.InOutQuad }
                        // AnchorAnimation{easing.type: Easing.InOutQuad}
                        NumberAnimation { target: idStartStop; property: "opacity"; from: 1; to: 0; duration: 300 }
                        NumberAnimation { target: idStartStop; property: "opacity"; from: 0; to: 1; duration: 300 }
                    },

                    Transition {
                        from: "stop"; to: "start"
                        SequentialAnimation{
                            //running: idStartStop.state === "start"
                            loops: Animation.Infinite
                            NumberAnimation { properties: "scale"; from: 1; to: 1.5; duration: 2000}
                            PauseAnimation {
                                duration: 500
                            }
                            NumberAnimation { properties: "scale"; from: 1.5; to: 1; duration: 2000}
                            PauseAnimation {
                                duration: 2000
                            }
                        }

                        NumberAnimation { properties: "opacity", textIcon; duration: 2000; easing.type: Easing.InOutQuad }
                        NumberAnimation { properties: "y"; duration: 2000; easing.type: Easing.InOutQuad }
                        // AnchorAnimation{easing.type: Easing.InOutQuad}
                        NumberAnimation { target: idStartStop; property: "opacity"; from: 0; to: 1; duration: 300 }
                        NumberAnimation { target: idStartStop; property: "opacity"; from: 0; to: 1; duration: 300 }
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
