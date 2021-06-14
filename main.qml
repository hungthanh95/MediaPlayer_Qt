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
    title: qsTr("Media Player") + translator.emptyString

    // Media Player now is myPlayer
    // Background of the Application
    Image {
        anchors.fill: parent
        source: "Image/background.png"
    }

    // Header
    Header {
        id: headerId
        onPlaylistButtonStatusChanged: {
            if (headerId.playlistButtonStatus) {
                drawer.open()
            } else {
                drawer.close()
            }

        }
    }

    Drawer {
        id : drawer
        property alias aliasplaylistId: playlistId
        implicitWidth: aliasplaylistId.width
        implicitHeight : aliasplaylistId.height
        interactive: false
        modal: false
        y: headerId.height
        background: Rectangle {
            id: playList_bg
            anchors.fill: parent
            color: "transparent"
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

            model: playplistModel

            onCurrentItemChanged: {
                player.playlist.setCurrentIndex(playlistId.currentIndex);
                player.play();
            }

            onIsMutedChanged: {
                player.setMuted(playlistId.isMuted)
            }
        }
//        Component.onCompleted: drawer.open()
    }

    // Media info
    MediaInfo {
        id: mediaInfoId
        height: 200
        anchors {
            top: headerId.bottom
            left : parent.left
            leftMargin: 675 * drawer.position
            right: parent.right
        }
        songDetail: playlistId.currentItem.myData
        totalSong: playlistId.count
    }


    // Album thumbnail
    AlbumThumbnail {
        id: albumThumnailId
        anchors {
            top: mediaInfoId.bottom
            left: parent.left
            right: parent.right

            leftMargin: (parent.width - 1100)/2 + 675 * drawer.position/2
            topMargin: 120
        }
        model: playplistModel
        playlist: playlistId
    }

    // ProgressBar
    MyProgressBar {
        id: myProgressBarId
        anchors {
            right: parent.right
            left: parent.left
            top: albumThumnailId.bottom

            leftMargin: 675 * drawer.position
            topMargin: 380
        }


    }

    // Media ButtonControl
    GroupButtonsControl {
        id: groupButtonsControlId
        anchors {
            top: myProgressBarId.bottom
            left: parent.left
            right: parent.right

            topMargin: 50
            leftMargin: 675 * drawer.position
        }
    }

    Connections{
        target: player.playlist
        onCurrentIndexChanged: {
            playlistId.currentIndex = player.playlist.currentIndex
        }
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
