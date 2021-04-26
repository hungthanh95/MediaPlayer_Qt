import QtQuick 2.12
import QtQuick.Layouts 1.12

ColumnLayout {
    implicitHeight: playlistImgId.height
    implicitWidth: playlistImgId.width

    property alias pItemHeight: playlistItemId.height

    Image {
        id: playlistImgId
        source: "Image/playlist.png"

        Image {
            id: playlistItemId
            source: "Image/playlist_item.png"

            Text {
                color: "gray"
                font.pointSize: 20
                text: "Playlist Item"
                padding: 20
                anchors.verticalCenter: parent.verticalCenter
            }
        }
    }
}
