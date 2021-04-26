import QtQuick 2.12
import QtQuick.Layouts 1.12

ColumnLayout {
    id: rightPanelId
    MediaInfo {
        id: mediaInfoId
        Layout.alignment: Qt.AlignTop
        width: rightPanelId.width
        height: rightPanelId.height
    }
    GroupThumbnail {
        Layout.alignment: Qt.AlignVCenter
    }
    GroupButtonsControl {

        Layout.alignment: Qt.AlignBottom
    }
    Component.onCompleted: {
        console.log("RightPanel width: " + rightPanelId.width)
        console.log("RightPanel height: " + rightPanelId.height)
        console.log("MediaInfo width: " + mediaInfoId.width)
        console.log("MediaInfo height: " + mediaInfoId.height)
    }
}
