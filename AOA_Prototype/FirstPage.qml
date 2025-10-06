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
        CustomLableButtonsGroup{
            id: idPowerThemeRow
            anchors.top: parent.top
            groupeState: "light"
            buttonModel: ListModel {
                ListElement { icon: "\uF015"; buttonIconSize: 40; onClick: function() { Qt.quit() } } //Todo: Power icon unicode "\uF011" needs to be fixed
                ListElement { icon: "\u25D0"; buttonIconSize: 40; onClick: function() { //Todo: icon size needs to be fixed
                    if (state === "dark")
                    {
                        state = "light"
                        idMainRectangle.state = "light"
                        idFavouritePlanet.groupeState = "light"
                        idAgeGroupe.groupeState = "light"
                        idPowerThemeRow.groupeState = "light"
                        idStartStop.state = "light"
                        idCustomImageRight.imageColor = idTheme.textColor
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
                        idCustomImageRight.imageColor = idTheme.pageColor
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
            ListElement { icon: "\uF77C"; buttonIconSize: 40; onClick: function() { idCustomImageRight.imageIcon = "\uF77C";
                idCustomImageLeft.imageIcon = "\uF77D"; idCustomImageLeft.imageColor = idTheme.accentColor }}
            ListElement { icon: "\uF1AE"; buttonIconSize: 40; onClick: function() { idCustomImageRight.imageIcon = "\uF1AE";
                idCustomImageLeft.imageIcon = "\uF1E3"; idCustomImageLeft.imageColor ="#90caf9" }}
            ListElement { icon: "\uF183"; buttonIconSize: 40; onClick: function() { idCustomImageRight.imageIcon = "\uF183";
                idCustomImageLeft.imageIcon = "\uF604"; idCustomImageLeft.imageColor ="#979dac" }}
            ListElement { icon: "\uE53C"; buttonIconSize: 40; onClick: function() { idCustomImageRight.imageIcon = "\uE53C";  //Todo: Power icon unicode "\uE53C" needs to be fixed
                idCustomImageLeft.imageIcon = "\uF06C"; idCustomImageLeft.imageColor ="#ffd500" }}
        }
        ListModel
        {
            id: model2
            ListElement { icon: "\uF77C"; buttonIconSize: 40; onClick: function() { idCustomImageRight.imageIcon = "\uF77C";
                idCustomImageLeft.imageIcon = "\uF77D"; idCustomImageLeft.imageColor =idTheme.accentColor }}
            ListElement { icon: "\uE59C"; buttonIconSize: 40; onClick: function() { idCustomImageRight.imageIcon = "\uE59C";
                idCustomImageLeft.imageIcon = "\uF1E3"; idCustomImageLeft.imageColor ="#90caf9" }}
            ListElement { icon: "\uF182"; buttonIconSize: 40; onClick: function() { idCustomImageRight.imageIcon = "\uF182";
                idCustomImageLeft.imageIcon = "\uF604"; idCustomImageLeft.imageColor ="#979dac" }}
            ListElement { icon: "\uE53C"; buttonIconSize: 40; onClick: function() { idCustomImageRight.imageIcon = "\uE53C";  //Todo: Power icon unicode "\uE53C" needs to be fixed
                idCustomImageLeft.imageIcon = "\uF06C"; idCustomImageLeft.imageColor ="#ffd500" }}
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
        CustomButtonStartStop{
            id: idStartStop
            anchors.top: idAgeGroupe.bottom
            anchors.topMargin: 20
            textOpacity: 1
            Behavior on textOpacity {
                NumberAnimation { duration: 300; easing.type: Easing.InOutQuad }
            }
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
        //##################################################################################################################
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
//##################################################################################################################
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
            imageColor: idTheme.textColor
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
