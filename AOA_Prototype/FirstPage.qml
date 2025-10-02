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
    //##################################################################################################################
    Rectangle{
        id:idLeftRectangle
        anchors.left: parent.left
        anchors.margins: 20
        height: parent.height
        width: parent.width/2
        color: Qt.rgba(0,0,0,0)
        //##################################################################################################################
        // Column{
        //     id: idMainColumn
        //     anchors.fill: parent
        //     anchors.leftMargin: idTheme.ySpace
        //     spacing: idTheme.ySpace

        // CustomImage{
        //     id: idCustomImageLeft
        //     // anchors.bottom: parent.bottom
        //      // anchors.top: idStartStop.bottom
        //     x:-50
        //     // y: idLeftRectangle.height - 50
        // }
        //##################################################################################################################
        CustomLableButtonsGroup{
            id: idPowerThemeRow
            anchors.top: parent.top
            // anchors.bottom: idFavouritePlanet.top
            groupeState: "light"
            buttonModel: ListModel {
                ListElement { icon: "\uF015"; buttonIconSize: 40; onClick: function() { Qt.quit() } }
                ListElement { icon: "\u25D0"; buttonIconSize: 40; onClick: function() {
                    if (state === "dark")
                    {
                        state = "light"
                        idMainRectangle.state = "light"
                        idFavouritePlanet.groupeState = "light"
                        idAgeGroupe.groupeState = "light"
                        idPowerThemeRow.groupeState = "light"
                        idStartStop.state = "light"
                        console.log("state = light")
                    }
                    else
                    {
                        state = "dark"
                        idMainRectangle.state = "dark"
                        idFavouritePlanet.groupeState= "dark"
                        idAgeGroupe.groupeState= "dark"
                        idPowerThemeRow.groupeState = "dark"
                        idStartStop.state = "dark"
                        console.log("state = dark")
                    }}
                }
            }
        }
        //##################################################################################################################
        CustomLableButtonsGroup{
            id: idFavouritePlanet
            anchors.top: idPowerThemeRow.bottom
            anchors.topMargin: 20
            // anchors.bottom: idAgeGroupe.top
            lableText: qsTr("Favourite Planet:")
            groupeState: "light"
            groupeOpicity: 1
            visible: groupeOpicity
            buttonModel: ListModel {
                ListElement { icon: "\uF222"; buttonIconSize: 40; onClick: function() { idAgeGroupe.buttonModel = model1 } }
                ListElement { icon: "\uF221"; buttonIconSize: 40; onClick: function() { idAgeGroupe.buttonModel = model2 } }
            }
            state: "stop"
            states: [
                State {
                    name: "start"
                    PropertyChanges {target: idFavouritePlanet;  opacity: 0 }
                },
                State {
                    name: "stop"
                    PropertyChanges {target: idFavouritePlanet;  opacity: 1 }
                }
            ]

            transitions: [
                Transition {
                    from: "stop"; to: "start"
                    NumberAnimation { properties: "opacity" ; duration: 1500; easing.type: Easing.InOutQuad }
                },
                Transition {
                    from: "start"; to: "stop"
                    NumberAnimation { properties: "opacity"; duration: 1500; easing.type: Easing.InOutQuad }
                }
            ]
        }
        //##################################################################################################################
        // Age group models
        ListModel
        {
            id: model1
            ListElement { icon: "\uF77C"; buttonIconSize: 40; onClick: function() { idCustomImageLeft.imageIcon = "\uF77D" }}
            ListElement { icon: "\uF1AE"; buttonIconSize: 40; onClick: function() { idCustomImageLeft.imageIcon = "\uF1E3" }}
            ListElement { icon: "\uF183"; buttonIconSize: 40; onClick: function() { idCustomImageLeft.imageIcon = "\uF604" }}
            ListElement { icon: "\uE53C"; buttonIconSize: 40; onClick: function() { idCustomImageLeft.imageIcon = "\uF06C" }}
        }
        ListModel
        {
            id: model2
            ListElement { icon: "\uF77C"; buttonIconSize: 40; onClick: function() { idCustomImageLeft.imageIcon = "\uF77D" }}
            ListElement { icon: "\uE59C"; buttonIconSize: 40; onClick: function() { idCustomImageLeft.imageIcon = "\uF1AE" }}
            ListElement { icon: "\uF182"; buttonIconSize: 40; onClick: function() { idCustomImageLeft.imageIcon = "\uF604" }}
            ListElement { icon: "\uE53C"; buttonIconSize: 40; onClick: function() { idCustomImageLeft.imageIcon = "\uF06C" }}
        }
        //##################################################################################################################
        CustomLableButtonsGroup{
            id: idAgeGroupe
            anchors.top: idFavouritePlanet.bottom
            anchors.topMargin: 20
            // anchors.bottom: idStartStop.top
            groupeOpicity: 1
            visible: groupeOpicity
            lableText: "Age groupe:"
            groupeState: "light"
            buttonModel: model1
            state: "stop"
            states: [
                State {
                    name: "start"
                    PropertyChanges {target: idAgeGroupe;  opacity: 0 }
                    AnchorChanges {target: idStartStop; anchors.top: idPowerThemeRow.bottom }
                },
                State {
                    name: "stop"
                    PropertyChanges {target: idAgeGroupe;  opacity: 1 }
                    AnchorChanges {target: idStartStop; anchors.top:idAgeGroupe.bottom}
                }
            ]

            transitions: [
                Transition {
                    from: "stop"; to: "start"
                    NumberAnimation { properties: "opacity" ; duration: 1500; easing.type: Easing.InOutQuad }
                    AnchorAnimation{ duration: 1500; easing.type: Easing.InOutQuad}
                },
                Transition {
                    from: "start"; to: "stop"
                    NumberAnimation { properties: "opacity"; duration: 1500; easing.type: Easing.InOutQuad }
                    AnchorAnimation{ duration: 1500; easing.type: Easing.InOutQuad}
                }
            ]
        }
        //##################################################################################################################
        // CustomLableButtonsGroup{
        //     id: idAStartStop
        //     groupeState: "light"
        //     buttonModel: ListModel {
        //         ListElement { icon: "Start handling "; text: "\uF0DA"}}
        // }
        // that approch work but needs more inhancement
        //##################################################################################################################
        CustomButton2{
            id: idStartStop
            anchors.top: idAgeGroupe.bottom
            anchors.topMargin: 20
            textOpacity: 1
            Behavior on textOpacity {
                NumberAnimation { duration: 300; easing.type: Easing.InOutQuad }
            }
            // Text properties
            property string startText: "Start healing " + "\uF0DA"
            property string stopText: "Stop " + "\uF256"
            buttonText: startText
            state: "light"
            onClicked: {
                if(idAgeGroupe.state ==="stop" )
                {
                    idAgeGroupe.state ="start"; idFavouritePlanet.state ="start"
                    idCustomImageLeft.state = "start"; idCustomImageRight.state = "start"
                    buttonText = stopText
                    console.log("state = start ")
                }
                else
                {
                    idAgeGroupe.state ="stop"; idFavouritePlanet.state ="stop"
                    idCustomImageLeft.state = "stop" ;idCustomImageRight.state = "stop"
                     buttonText = startText
                    console.log("state = stop ")
                }
            }
        }
        CustomImage{
            id: idCustomImageLeft
            y:parent.height - 2.2*height/3
            x:-50
            z:-1
            transformOrigin: Item.Center
            state: "stop"
            states: [
                State {
                    name: "start"
                    PropertyChanges { target: idCustomImageLeft; scale: 1 }
                },
                State {
                    name: "stop"
                    PropertyChanges { target: idCustomImageLeft; scale: 1 }

                }
            ]
            transitions: [
                Transition {
                    from: "stop"; to: "start"
                    // NumberAnimation { properties: "opacity" ; duration: 2000; easing.type: Easing.InOutQuad }
                    AnchorAnimation{ duration: 2000; easing.type: Easing.InOutQuad}
                    SequentialAnimation{
                        loops: Animation.Infinite
                        PauseAnimation {
                            duration: 2000
                        }
                        NumberAnimation { properties: "scale"; from: 1; to: 0.8; duration: 2000}
                        PauseAnimation {
                            duration: 1000
                        }
                        NumberAnimation { properties: "scale"; from: 0.8; to: 1; duration: 500}
                        PauseAnimation {
                            duration: 50
                        }
                    }
                },
                Transition {
                    from: "start"; to: "stop"
                }
            ]
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
            x: parent.width - 200
            y: 50
            imageIcon: "\uF77C"
            imageSize: 150
            transformOrigin: Item.BottomLeft
            state: "stop"
            states: [
                State {
                    name: "start"
                    PropertyChanges { target: idCustomImageRight; scale: 2 }
                    PropertyChanges {target: idCustomImageRight; x:parent.width - 500 }
                    PropertyChanges {target: idCustomImageRight; y:250 }
                },
                State {
                    name: "stop"
                    PropertyChanges { target: idCustomImageRight; scale: 1 }
                    PropertyChanges {target: idCustomImageRight; x:parent.width - 200 }
                    PropertyChanges {target: idCustomImageRight; y:50 }
                }
            ]
            transitions: [
                Transition {
                    from: "stop"; to: "start"
                    NumberAnimation { properties: "scale"; from: 1; to: 2; duration: 1500}
                    NumberAnimation { properties: "x"; duration: 1500}
                    NumberAnimation { properties: "y"; duration: 1500}
                },
                Transition {
                    from: "start"; to: "stop"
                    NumberAnimation { properties: "scale"; from: 2; to: 1; duration: 1500}
                    NumberAnimation { properties: "x"; duration: 1500}
                    NumberAnimation { properties: "y"; duration: 1500}
                }
            ]
        }
    }

}
