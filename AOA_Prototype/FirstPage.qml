import QtQuick
import QtQuick.Controls

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
    }

    Rectangle{
        id:idRightRectangle
        anchors.right: parent.right
        height: parent.height
        width: parent.width/2
        color: Qt.rgba(0,0,0,0)
    }

}
