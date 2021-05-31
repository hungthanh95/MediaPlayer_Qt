import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Window 2.12
import QtQml.Models 2.15
import QtMultimedia 5.8
import QtQuick.Dialogs 1.3


Window {
    id: root
    width: 1920
    height: 1080
    visible: true
    visibility: "FullScreen"
    title: qsTr("Media Player")

    // Media Player
//    MyMediaPlayer {
//        id: mediaPlayerId
//    }

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

        model: m_playplistModel

        onCurrentItemChanged: {
//            m_player.source = playlistId.currentItem.myData.source;
            m_player.playlist.setCurrentIndex(playlistId.currentIndex);
            m_player.play();
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
        anchors.top: mediaInfoId.bottom
        anchors.topMargin: 120

        anchors.left: playlistId.right
        anchors.leftMargin: 60

        model: m_playplistModel
        playlist: playlistId
    }

    // ProgressBar
    MyProgressBar {
        id: myProgressBarId
        width: parent.width - playlistId.width

        anchors.left: playlistId.right
        anchors.leftMargin: 200
        anchors.topMargin: 380
        anchors.top: albumThumnailId.bottom

        player: m_player
    }

    // Media ButtonControl
    GroupButtonsControl {
        id: groupButtonsControlId
        width: parent.width - playlistId.width
        anchors.top: myProgressBarId.bottom
        anchors.topMargin: 50

        anchors.left: playlistId.right

        player: m_player
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
