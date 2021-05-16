import QtQuick 2.12
import QtQuick.Window 2.12
import QtMultimedia 5.8

Window {
    id: root
    width: 1920
    height: 1080
    visible: true
    visibility: "FullScreen"
//    title: qsTr("Media Player")

    // Media Player



    // Background of the Application
    Image {
        anchors.fill: parent
        source: "Image/background.png"
    }

    // Header
    Header {
        id: headerId
    }

    // Add Playlist Models
    PlaylistModels {
        id: playlistModelsId
    }

    // Playlist
    PlaylistView {
        id: playlistId
        width: 675
        height: 193
        anchors.top : headerId.bottom
        playlistModels: playlistModelsId
    }

    // Media info
    MediaInfo {
        id: mediaInfoId
        width: parent.width - playlistId.width
        height: 200
        anchors.left : playlistId.right
        anchors.top: headerId.bottom

        songDetail: playlistId.currentSong.myData
        totalSong: playlistModelsId.count
    }

    // Album thumbnail
    AlbumThumbnail {
        id: albumThumnailId
        width: parent.width - playlistId.width
//        height: 400
        anchors.top: mediaInfoId.bottom
        anchors.topMargin: 120

        anchors.left: playlistId.right
        anchors.leftMargin: 60

        model: playlistModelsId
    }

//     ProgressBar
    MyProgressBar {
        id: myProgressBarId
        width: parent.width - playlistId.width
        anchors.top: albumThumnailId.bottom
        anchors.left: playlistId.right
        anchors.topMargin: 380
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
