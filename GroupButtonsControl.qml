import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtMultimedia 5.8

RowLayout {
    id: groupButtonsControlId
    property variant my_player: NULL
    property variant player: NULL

    SwitchButton {
        icon_on: "Image/shuffle.png"
        icon_off: "Image/shuffle-1.png"
        Layout.alignment: Qt.AlignLeft
        Layout.leftMargin: 140
        onClicked: {
            my_player.shuffle();
        }
    }

    ButtonControl {
        icon_default: "Image/prev.png"
        icon_pressed: "Image/hold-prev.png"
        icon_released: "Image/prev.png"
        anchors.right: buttonPlayId.left
        onClicked: {
           my_player.prevMedia();
        }
    }

    ButtonControl {
        id: buttonPlayId
        Layout.alignment: Qt.AlignHCenter
        icon_default: player.state == MediaPlayer.PlayingState ?  "qrc:/Image/pause.png" : "qrc:/Image/play.png"
        icon_pressed: player.state == MediaPlayer.PlayingState ?  "qrc:/Image/hold-pause.png" : "qrc:/Image/hold-play.png"
        icon_released: player.state == MediaPlayer.PlayingState ?  "qrc:/Image/pause.png" : "qrc:/Image/play.png"

        onClicked: {
            my_player.play();
        }
    }

    Connections {
        target: player
       function onStateChanged() {
            if (player.state == MediaPlayer.PlayingState) {
                buttonPlayId.source = "qrc:/Image/pause.png"
            } else {
                buttonPlayId.source = "qrc:/Image/play.png"
            }
        }
    }

    ButtonControl {
         icon_default: "Image/next.png"
        icon_pressed: "Image/hold-next.png"
        icon_released: "Image/next.png"
        anchors.left: buttonPlayId.right
        onClicked: {
            my_player.nextMedia();
        }
    }


    SwitchButton {
        icon_on: "Image/repeat.png"
        icon_off: "Image/repeat1_hold.png"
        Layout.alignment: Qt.AlignRight
        Layout.rightMargin: 140
        onClicked: {
            my_player.repeater();
        }
    }
}


