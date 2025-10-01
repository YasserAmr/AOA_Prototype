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
                        // idStartStop.state = "light"
                        console.log("state = light")
                    }
                    else
                    {
                        state = "dark"
                        idMainRectangle.state = "dark"
                        idFavouritePlanet.groupeState= "dark"
                        idAgeGroupe.groupeState= "dark"
                        idPowerThemeRow.groupeState = "dark"
                        // idStartStop.state = "dark"
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
        }
        //##################################################################################################################
}

}
