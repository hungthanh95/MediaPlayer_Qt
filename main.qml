import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Window 2.12
import QtQml.Models 2.15
import QtMultimedia 5.8

Window {
    id: root
    width: 1920
    height: 1080
    visible: true
    visibility: "FullScreen"
    title: qsTr("Media Player")

    // Media Player
    MediaPlayer {
        id: mediaPlayerId
        property bool shuffer: false
        property bool repeater: false
        loops: repeater ? MediaPlayer.Infinite : 1
        onPlaybackStateChanged: {
            if (playbackState == MediaPlayer.StoppedState &&
            position == duration) {
                if (mediaPlayerId.shuffer) {
                    var newIndex = Math.floor(Math.random() * playlistId.count)
                    while (newIndex == playlistId.currentIndex) {
                        newIndex = Math.floor(Math.random() * playlistId.count)
                    }
                    playlistId.currentIndex = newIndex;
                } else if (playlistId.currentIndex < playlistId.count - 1) {
                    playlistId.currentIndex = playlistId.currentIndex + 1;
                }
            }
        }
        autoPlay: true
    }



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
    Image {
        id: playlistImg
        anchors.top: headerId.bottom
        anchors.bottom: parent.bottom
        source: "qrc:/Image/playlist.png"
        opacity: 0.2
    }
    PlaylistView {
        id: playlistId
        width: 675
        height: 193
        anchors.fill: playlistImg
        anchors.top : headerId.bottom

        model: playlistModelsId

        onCurrentItemChanged: {
            mediaPlayerId.source = playlistId.currentItem.myData.source;
            mediaPlayerId.play();
        }
    }

    // Media info
    MediaInfo {
        id: mediaInfoId
        width: parent.width - playlistId.width
        height: 200
        anchors.left : playlistId.right
        anchors.top: headerId.bottom

        songDetail: playlistId.currentItem.myData
        totalSong: playlistId.count
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
        playlist: playlistId
    }

    //     ProgressBar
    MyProgressBar {
        id: myProgressBarId
        width: parent.width - playlistId.width
        anchors.top: albumThumnailId.bottom
        anchors.left: playlistId.right
        anchors.topMargin: 380
        anchors.leftMargin: 200

        currentTime: mediaPlayerId.position
        totalTime: mediaPlayerId.duration
        player: mediaPlayerId
    }

    // Media ButtonControl
    GroupButtonsControl {
        id: groupButtonsControlId
        width: parent.width - playlistId.width
        anchors.top: myProgressBarId.bottom
        anchors.left: playlistId.right
        anchors.topMargin: 50

        player: mediaPlayerId
        playlist: playlistId
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
