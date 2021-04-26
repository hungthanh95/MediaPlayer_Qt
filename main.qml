import QtQuick 2.12
import QtQuick.Window 2.12


Window {
    width: 800
    height: 600
    visible: true
    visibility: "FullScreen"
    title: qsTr("Media Player")

    // Background of the Application
    Image {
        anchors.fill: parent
        source: "Image/background.png"
    }

    // Header
    Header {
        id: headerId
    }

    // Playlist
    Playlist {
        id: playlistId
        anchors.top : headerId.bottom
        Component.onCompleted: {
            console.log("Playlist width: " + width)
            console.log("Playlist height: " + height)
        }
    }

    // Media info
    MediaInfo {
        id: mediaInfoId
        width: parent.width - playlistId.width
        height: playlistId.pItemHeight / 2
        anchors.left : playlistId.right
        anchors.top: headerId.bottom
    }
    Text {
        id: singerId
        width: parent.width - playlistId.width
        height: playlistId.pItemHeight / 2
        font.pointSize: 20
        color: "white"
        text: "Singer"
        padding: 20
        anchors.top: mediaInfoId.bottom
        anchors.left: playlistId.right
    }

    // Album thumbnail
    AlbumThumbnail {
        id: albumThumnailId
        width: parent.width - playlistId.width
        anchors.top: singerId.bottom
        anchors.left: playlistId.right
    }

//     ProgressBar
    MyProgressBar {
        id: myProgressBarId
        width: parent.width - playlistId.width
        anchors.top: albumThumnailId.bottom
        anchors.left: playlistId.right
        anchors.topMargin: 70
        anchors.leftMargin: 200
    }
    // Media ButtonControl
    GroupButtonsControl {
        id: groupButtonsControlId
        width: parent.width - playlistId.width
        anchors.top: myProgressBarId.bottom
        anchors.left: playlistId.right
        anchors.topMargin: 50
    }

    //Quit App
    Item {
        focus: true
        Keys.onPressed: {
            if (event.key === Qt.Key_Escape) {
                Qt.quit()
            }
        }
    }

}
