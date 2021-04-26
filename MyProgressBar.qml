import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

Item {
    Text {
        id: startTimeId
        color: "white"
        font.pointSize: 12
        text: "00:00"
        anchors.right: pbId.left
        anchors.rightMargin: 20
    }
    Item {
        id: pbId
        width: 816
        height: 30

        Image {
            id: progressBarId
            width: pointId.x
            source: "Image/progress_bar.png"
            anchors.left: pbId.left
            anchors.verticalCenter: pbId.verticalCenter
        }
        Image {
            id: progressBarBgId
            width: pbId.width - pointId.x
            anchors.right: pbId.right
            source: "Image/progress_bar_bg.png"
            anchors.verticalCenter: pbId.verticalCenter
        }
        Image {
            id: pointId
            x: pbId.x
            y: pbId.y
            source: "Image/point.png"
        }
        Image {
            id: pointCenterId
            x: pointId.x + 4
            y: pointId.y + 4
            source: "Image/center_point.png"
        }

        MouseArea {
            anchors.fill: parent
             drag.target: pointId
             drag.axis: Drag.XAxis
             drag.minimumX: 0
             drag.maximumX: pbId.width
        }
        Text {
            id: endTimeId
            color: "white"
            text: "00:00"
            font.pointSize: 12
            anchors.left: pbId.right
            anchors.leftMargin: 30
        }
    }
}


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

