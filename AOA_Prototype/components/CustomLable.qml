import QtQuick 2.15
import theme
import "../"

Item {
    id: idAlableTextItem
    Theme{
        id: idTheme
    }
    property alias text: idAlableText.text
    property string themeState: "light"
    implicitWidth: idAlableText.implicitWidth
    implicitHeight: idAlableText.implicitHeight
    Text {
        id: idAlableText
        text: text
        font.family: idTheme.lableFontName
        font.pixelSize: idTheme.lableFontSize
        state: idAlableTextItem.themeState
        color: idAlableTextItem.themeState === "dark" ? idTheme.pageColor : idTheme.textColor
    }
}
