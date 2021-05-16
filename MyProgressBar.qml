import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

//Item {
//    Text {
//        id: currentTime
//        color: "white"
//        font.pointSize: 12
//        text: "00:00"
//        anchors.right: pbId.left
//        anchors.rightMargin: 20
//    }
//    Item {
//        id: pbId
//        width: 816
//        height: 30

//        Image {
//            id: progressBarId
//            width: pointId.x
//            source: "Image/progress_bar.png"
//            anchors.left: pbId.left
//            anchors.verticalCenter: pbId.verticalCenter
//        }
//        Image {
//            id: progressBarBgId
//            width: pbId.width - pointId.x
//            anchors.right: pbId.right
//            source: "Image/progress_bar_bg.png"
//            anchors.verticalCenter: pbId.verticalCenter
//        }
//        Image {
//            id: pointId
//            x: pbId.x
//            y: pbId.y
//            source: "Image/point.png"
//        }
//        Image {
//            id: pointCenterId
//            x: pointId.x + 4
//            y: pointId.y + 4
//            source: "Image/center_point.png"
//        }

//        MouseArea {
//            anchors.fill: parent
//             drag.target: pointId
//             drag.axis: Drag.XAxis
//             drag.minimumX: 0
//             drag.maximumX: pbId.width
//        }
//        Text {
//            id: totalTime
//            color: "white"
//            text: "00:00"
//            font.pointSize: 12
//            anchors.left: pbId.right
//            anchors.leftMargin: 30
//        }
//    }
//}


//    ColumnLayout {
//        anchors.fill: parent
//        ProgressBar {
//            id: myProgressBarId
//            Layout.fillWidth: true
//            from: mySliderId.from
//            to: mySliderId.to
//            value: mySliderId.value
//        }

//        Slider {
//           id: mySliderId
//           Layout.fillWidth: true
//           from: 0
//           to: 100
//           stepSize:5
//           value:50
//        }

//        Text {
//            id: myValueId
//            text: mySliderId.value
//            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
//            font.pointSize: 20
//            horizontalAlignment: Text.AlignHCenter
//            verticalAlignment: Text.AlignVCenter
//        }
//    }

Item {
    Text {
        id: currentTime
        color: "white"
        font.pointSize: 14
        text: "00:00"
        anchors.right: progressBar.left
        anchors.rightMargin: 20
    }

    Slider{
        id: progressBar
        width: 816
        anchors.left: currentTime.right
        anchors.leftMargin: 20
//        from: ...
//        to: ...
//        value: player....
        background: Rectangle {
            x: progressBar.leftPadding
            y: progressBar.topPadding + progressBar.availableHeight / 2 - height / 2
            implicitWidth: 200
            implicitHeight: 4
            width: progressBar.availableWidth
            height: implicitHeight
            radius: 2
            color: "gray"

            Rectangle {
                width: progressBar.visualPosition * parent.width
                height: parent.height
                color: "white"
                radius: 2
            }
        }
        handle: Image {
            anchors.verticalCenter: parent.verticalCenter
            x: progressBar.leftPadding + progressBar.visualPosition * (progressBar.availableWidth - width)
            y: progressBar.topPadding + progressBar.availableHeight / 2 - height / 2
            source: "qrc:/Image/point.png"
            Image {
                anchors.centerIn: parent
                source: "qrc:/Image/center_point.png"
            }
        }
        onMoved: {
            if (player.seekable){
//                player....
            }
        }
    }


    Text {
        id: totalTime
        color: "white"
        text: "00:00"
        font.pointSize: 14
        anchors.left: progressBar.right
        anchors.leftMargin: 30
    }
}
