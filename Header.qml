import QtQuick 2.0

Item {
    id: headerItemId
    width: headerImageId.width
    height: headerImageId.height
    anchors.topMargin: parent
    Image {
        id: headerImageId
        source: "Image/title.png"
    }
    Text {
        anchors.centerIn: headerItemId
        color: "white"
        text: "Media Player"
        font.pointSize: 30
    }
}
