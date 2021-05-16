import QtQuick 2.12
import QtQuick.Layouts 1.12

Item {
    id: columnId
    property variant songDetail: NULL
    property int totalSong: 0
    RowLayout {
        id: rowId
        width: columnId.width
        height: columnId.height / 2
        Layout.alignment: Qt.AlignTop
        Text {
            id: songTitleId
            padding: 20
            font.pointSize: 25
            color: "white"
            text: songDetail.title
            Layout.alignment: Qt.AlignLeft
        }
        Image {
            id: musicIconId
            source: "Image/music.png"
            anchors.right : numberId.left
        }
        Text {
            id: numberId
            padding: 20
            text: totalSong
            font.pointSize: 20
            color: "white"
            Layout.alignment: Qt.AlignRight
        }
    }
        Text {
            id: singerId
            font.pointSize: 20
            color: "white"
            text: songDetail.singer
            padding: 20

            anchors.top: rowId.bottom
            anchors.left: columnId.left
        }
}






