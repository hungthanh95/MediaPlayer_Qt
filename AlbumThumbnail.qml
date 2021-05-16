import QtQuick 2.12
import QtQuick.Layouts 1.12

PathView {
    id: albumThumnail
    property variant playlist: NULL

    preferredHighlightBegin: 0.5
    preferredHighlightEnd: 0.5
    focus: true

    delegate: Item {
        width: 400; height: 400
        scale: PathView.iconScale

        Image {
            id: myIcon
            width: parent.width
            height: parent.height
            y: 20
            anchors.horizontalCenter: parent.horizontalCenter
            source: icon
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                albumThumnail.currentIndex = index
            }
        }
    }
    path: Path {
        startX: 20
        startY: 70
        PathAttribute { name: "iconScale"; value: 0.5 }
        PathLine { x: 550; y: 50 }
        PathAttribute { name: "iconScale"; value: 1.0 }
        PathLine { x: 1100; y: 50 }
        PathAttribute { name: "iconScale"; value: 0.5 }
    }

    onCurrentIndexChanged: {
        playlist.currentIndex = albumThumnail.currentIndex
    }

    Connections {
        target: playlist
        onCurrentIndexChanged: {
            albumThumnail.currentIndex = playlist.currentIndex
        }
    }
}
