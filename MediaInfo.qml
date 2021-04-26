import QtQuick 2.12
import QtQuick.Layouts 1.12


RowLayout {
    Layout.alignment: Qt.AlignTop
    Text {
        id: songTitleId
        padding: 20
        font.pointSize: 20
        color: "white"
        text: "Music Title"
        Layout.alignment: Qt.AlignLeft
    }
    Image {
        id: musicIconId
        source: "Image/music.png"
//            Layout.alignment: Qt.AlignRight
        anchors.right : numberId.left
    }
    Text {
        id: numberId
        padding: 20
        text: "3"
        font.pointSize: 20
        color: "white"
        Layout.alignment: Qt.AlignRight
    }

    Component.onCompleted: {

        console.log("MediaInfo width: " + width)
        console.log("MediaInfo height: " + height)
    }
}





