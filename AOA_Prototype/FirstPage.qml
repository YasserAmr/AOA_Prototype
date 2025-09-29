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
                anchors.top: idAgeGroupe.bottom
            }

//##################################################################################################################
            CustomLableButtonsGroup{
                id: idPowerThemeRow
                groupeState: "light"
                buttonModel: ListModel {
                    ListElement { icon: "\uF015"; onClick: function() { Qt.quit() } }
                    ListElement { icon: "\u25D0"; onClick: function() {
                        if (state === "dark")
                        {
                            state = "light"
                            idMainRectangle.state = "light"
                            idFavouritePlanet.groupeState = "light"
                            idAgeGroupe.groupeState = "light"
                            idPowerThemeRow.groupeState = "light"
                            console.log("state = light")
                        }
                        else
                        {
                            state = "dark"
                            idMainRectangle.state = "dark"
                            idFavouritePlanet.groupeState= "dark"
                            idAgeGroupe.groupeState= "dark"
                            idPowerThemeRow.groupeState = "dark"
                            console.log("state = dark")
                        }}
                    }
                }
            }
//##################################################################################################################
            CustomLableButtonsGroup{
                id: idFavouritePlanet
                text: qsTr("Favourite Planet:")
                groupeState: "light"

                buttonModel: ListModel {
                    ListElement { icon: "\uF222"; onClick: function() { idAgeGroupe.buttonModel = model1 } }
                    ListElement { icon: "\uF221"; onClick: function() { idAgeGroupe.buttonModel = model2 } }
                }
            }
//##################################################################################################################
// Age group models
            ListModel
            {
                id: model1
                ListElement { icon: "\uF77C"; onClick: function() { idCustomImageLeft.imageIcon = "\uF77D" }}
                ListElement { icon: "\uF1AE"; onClick: function() { idCustomImageLeft.imageIcon = "\uF1E3" }}
                ListElement { icon: "\uF183"; onClick: function() { idCustomImageLeft.imageIcon = "\uF604" }}
                ListElement { icon: "\uE53C"; onClick: function() { idCustomImageLeft.imageIcon = "\uF06C" }}
            }
            ListModel
            {
                id: model2
                ListElement { icon: "\uF77C"; onClick: function() { idCustomImageLeft.imageIcon = "\uF77D" }}
                ListElement { icon: "\uE59C"; onClick: function() { idCustomImageLeft.imageIcon = "\uF1AE" }}
                ListElement { icon: "\uF182"; onClick: function() { idCustomImageLeft.imageIcon = "\uF604" }}
                ListElement { icon: "\uE53C"; onClick: function() { idCustomImageLeft.imageIcon = "\uF06C" }}
            }
//##################################################################################################################

            CustomLableButtonsGroup{
                id: idAgeGroupe
                text: "Age groupe:"
                groupeState: "light"
                property string icon1: "\uF77C"
                buttonModel: model1
            }

            // CustomLableButtonsGroup{
            //     id: planetSelector2
            //     buttonModel: ListModel {
            //         ListElement { icon:  "test" }
            //     }
            // }

            // CustomButton2{
            //     id: idStartStop
            //     textIcon: "Start handling "+ "\uF0DA" //toDo: Add Icon Size
            //     state: "stop"

            //     // onClicked: {
            //     //     if(state ==="stop" )
            //     //     {
            //     //         state ="start"
            //     //         console.log("state = start ")
            //     //     }
            //     //     else
            //     //     {
            //     //         state ="stop"
            //     //         console.log("state = stop ")
            //     //     }
            //     // }

            //     states: [
            //         State {
            //             name: "start"
            //             PropertyChanges { target: idSupColumn2;  opacity: 0 }
            //             PropertyChanges { target: idFirstSupColumn; opacity: 0 }
            //             PropertyChanges { target: idStartStop; y: 95 }
            //             // PropertyChanges { target: idStartStop; textIcon: "stop " + "\uF256" }
            //             //AnchorChanges { target: idStartStop; anchors.top: idFirstRow.bottom
            //             PropertyChanges { target: idCustomImageLeft; scale: 1 }
            //             //PropertyChanges { target: idCustomImageLeft; x: 100 }

            //         },
            //         State {
            //             name: "stop"
            //             PropertyChanges { target: idSupColumn2;  opacity: 1 }
            //             PropertyChanges { target: idFirstSupColumn; opacity: 1 }
            //             PropertyChanges { target: idStartStop; y: 320 }
            //             PropertyChanges { target: idStartStop; textIcon: "Start Healing " + "\uF0DA" }
            //             //AnchorChanges { target: idStartStop; anchors.top: idSupColumn2.bottom }
            //             PropertyChanges { target: idCustomImageLeft; scale: 1 }
            //         }
            //     ]

            //     transitions: [
            //         Transition {
            //             from: "start"; to: "stop"
            //             // NumberAnimation { properties: "opacity", textIcon; duration: 2000; easing.type: Easing.InOutQuad }
            //             NumberAnimation { properties: "y"; duration: 2000; easing.type: Easing.InOutQuad }
            //             // AnchorAnimation{easing.type: Easing.InOutQuad}
            //             NumberAnimation { target: idStartStop; property: "opacity"; from: 1; to: 0; duration: 300 }
            //             NumberAnimation { target: idStartStop; property: "opacity"; from: 0; to: 1; duration: 300 }
            //         },

            //         Transition {
            //             from: "stop"; to: "start"
            //             SequentialAnimation{
            //                 //running: idStartStop.state === "start"
            //                 loops: Animation.Infinite
            //                 NumberAnimation { properties: "scale"; from: 1; to: 1.5; duration: 2000}
            //                 PauseAnimation {
            //                     duration: 500
            //                 }
            //                 NumberAnimation { properties: "scale"; from: 1.5; to: 1; duration: 2000}
            //                 PauseAnimation {
            //                     duration: 2000
            //                 }
            //             }

            //             NumberAnimation { properties: "opacity", textIcon; duration: 2000; easing.type: Easing.InOutQuad }
            //             NumberAnimation { properties: "y"; duration: 2000; easing.type: Easing.InOutQuad }
            //             // AnchorAnimation{easing.type: Easing.InOutQuad}
            //             NumberAnimation { target: idStartStop; property: "opacity"; from: 0; to: 1; duration: 300 }
            //             NumberAnimation { target: idStartStop; property: "opacity"; from: 0; to: 1; duration: 300 }
            //         }
            //     ]
            // }


        }

    }

    Rectangle{
        id:idRightRectangle
        anchors.right: parent.right
        height: parent.height
        width: parent.width/2
        color: Qt.rgba(0,0,0,0)

        CustomImage{
            id: idCustomImageRight
            anchors.right: idRightRectangle.right
            anchors.top: idRightRectangle.top
            anchors.margins: 100
            imageSize: 100
        }
    }

}
