import QtQuick 2.0

Item {
    id: headerItemId
    property bool playlistButtonStatus: false
    property bool flagButtonStatus: true
    signal clickPlaylistButton

    width: headerImageId.width
    height: headerImageId.height
    anchors.topMargin: parent.topMargin
    Image {
        id: headerImageId
        source: "Image/title.png"
    }
    SwitchButton {
        id: playlist_button
        anchors.left: parent.left
        anchors.leftMargin: 20
        anchors.verticalCenter: parent.verticalCenter
        icon_off: "qrc:/Image/back.png"
        icon_on: "qrc:/Image/drawer.png"
        onClicked: {
            headerItemId.playlistButtonStatus = !headerItemId.playlistButtonStatus
        }
    }
    Text {
        anchors.left: playlist_button.right
        anchors.leftMargin: 5
        anchors.verticalCenter: parent.verticalCenter
        verticalAlignment: Text.AlignVCenter
        text: qsTr("Playlist") + translator.emptyString
        color: "white"
        font.pixelSize: 35
    }
    Text {
        anchors.centerIn: headerItemId
        color: "white"
        text: qsTr("Media Player") + translator.emptyString
        font.pointSize: 40
    }

    Image {
        id: vn_flag
        anchors.right: parent.right
        anchors.rightMargin: 20
        anchors.verticalCenter: parent.verticalCenter
        width: 50
        height: 50
        source: "qrc:/Image/vn.png"
        Rectangle{
            id: vn_flag_border
            width: 50
            height: 30
            anchors.verticalCenter: parent.verticalCenter
            border.color: "gray"
            border.width: 3
            color: "transparent"
            visible: false
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                headerItemId.flagButtonStatus = !headerItemId.flagButtonStatus;
            }
        }
    }
    Image {
        id: us_flag
        anchors.right: vn_flag.left
        anchors.rightMargin: 10
        anchors.verticalCenter: parent.verticalCenter
        width: 50
        height: 50
        source: "qrc:/Image/us.png"
        Rectangle{
            id: us_flag_border
            width: 50
            height: 30
            anchors.verticalCenter: parent.verticalCenter
            border.color: "gray"
            border.width: 3
            color: "transparent"
            visible: true
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                headerItemId.flagButtonStatus = !headerItemId.flagButtonStatus;
            }
        }
    }
    onFlagButtonStatusChanged: {
        us_flag_border.visible = headerItemId.flagButtonStatus
        vn_flag_border.visible = !headerItemId.flagButtonStatus
        if (headerItemId.flagButtonStatus) {
            translator.selectLanguage("en");
        } else {
            translator.selectLanguage("vi");
        }
    }
}
