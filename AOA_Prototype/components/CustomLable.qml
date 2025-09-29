import QtQuick 2.15
import QtQuick.Controls
Item {
    id: idAlableTextItem
    property alias text: idAlableText.text
    property string themeState: "light"
    implicitWidth: idAlableText.implicitWidth
    implicitHeight: idAlableText.implicitHeight
    Text {
        id: idAlableText
        text: lableText
        font.family: idTheme.lableFontName
        font.pixelSize: idTheme.lableFontSize
        state: themeState
        color: themeState === "dark" ? idTheme.pageColor : idTheme.textColor
    }
}
