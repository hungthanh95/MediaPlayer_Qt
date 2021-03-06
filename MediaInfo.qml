import QtQuick 2.12
import QtQuick.Layouts 1.12

Item {
    id: columnId
    property variant songDetail: NULL
    property int totalSong: 0
    RowLayout {
        id: rowId
        spacing: 1
        width: columnId.width
        height: columnId.height / 2 - 30
        Layout.alignment: Qt.AlignTop
        Text {
            id: songTitleId
            padding: 20
            font.pointSize: 25
            color: "white"
            text: songDetail.title
            Layout.alignment: Qt.AlignLeft

            onTextChanged: {
                textAnimationId.targets = [songTitleId, singerId]
                textAnimationId.restart()
            }
        }
        Item {
            id: groupNumMusicId
            width: Math.abs(columnId.width - songTitleId.width)
            height: columnId.height / 2

            Image {
                id: musicIconId
                source: "Image/music.png"
                anchors.verticalCenter: groupNumMusicId.verticalCenter
                anchors.right : numberId.left
            }
            Text {
                id: numberId
                padding: 20
                text: totalSong
                font.pointSize: 20
                color: "white"
                anchors.right: groupNumMusicId.right
            }
            Layout.alignment: Qt.AlignRight
        }
        Layout.margins: 0
    }
    Text {
        id: singerId
        font.pointSize: 20
        color: "white"
        text: songDetail.singer
        padding: 20
        anchors.bottomMargin: 100
        anchors.top: rowId.bottom
        anchors.left: columnId.left

    }

    NumberAnimation {
        id: textAnimationId
        property: "opacity"
        from: 0
        to: 1
        duration: 400
        easing.type: Easing.InOutQuad
    }
}







