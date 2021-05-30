import QtQuick 2.12
import QtQuick.Controls 2.12



ListView {
    id: playlistView
    clip: true
    currentIndex: 0
    delegate:
        MouseArea {
            property variant myData: model
            implicitHeight: playlistItemImg.height
            implicitWidth: playlistItemImg.width
            z: 99
            Image {
                id: playlistItemImg
                width: 675
                height: 193
                source: "Image/playlist.png"
                opacity: 0.5
            }

            Text {
                anchors.fill: parent
                color: "white"
                font.pointSize: 28
                text: title
                anchors.leftMargin: 80
                verticalAlignment: Text.AlignVCenter
            }
            onClicked: {
                playlistView.currentIndex = index
            }
            onPressed: {
                playlistItemImg.source = 'qrc:/Image/hold.png'
            }
            onReleased: {
                playlistItemImg.source = 'qrc:/Image/playlist.png'
            }
            onCanceled: {
                playlistItemImg.source = 'qrc:/Image/playlist.png'
            }
        }
    highlight: Image {
        source: "qrc:/Image/playlist_item.png"
        Image {
            id: playingIcon
            anchors.left: parent.left
            anchors.leftMargin: 15
            anchors.verticalCenter: parent.verticalCenter
            source: "qrc:/Image/playing.png"

            MouseArea {
                implicitHeight: playingIcon.height
                implicitWidth: playingIcon.width
                propagateComposedEvents: true
                z: 100
            }
        }
    }

    ScrollBar.vertical: ScrollBar {
        parent: playlistView.parent
        anchors.top: playlistView.top
        anchors.left: playlistView.right
        anchors.bottom: playlistView.bottom
    }

}
