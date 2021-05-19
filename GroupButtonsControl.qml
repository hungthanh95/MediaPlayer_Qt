import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtMultimedia 5.8

RowLayout {
    id: groupButtonsControlId
    property variant player: NULL
    property variant playlist: NULL

    SwitchButton {
        icon_on: "Image/shuffle.png"
        icon_off: "Image/shuffle-1.png"
        Layout.alignment: Qt.AlignLeft
        Layout.leftMargin: 140
        onClicked: {
            player.shuffer = !player.shuffer
        }
    }

    ButtonControl {
        icon_default: "Image/prev.png"
        icon_pressed: "Image/hold-prev.png"
        icon_released: "Image/prev.png"
        anchors.right: buttonPlayId.left
        onClicked: {
            if (playlist.currentIndex <= 0) {
                playlist.currentIndex = 0;
            } else {
                playlist.currentIndex--;
            }
        }
    }

    ButtonControl {
        id: buttonPlayId
        Layout.alignment: Qt.AlignHCenter
        icon_default: player.playbackState == MediaPlayer.PlayingState ?  "qrc:/Image/pause.png" : "qrc:/Image/play.png"
        icon_pressed: player.playbackState == MediaPlayer.PlayingState ?  "qrc:/Image/hold-pause.png" : "qrc:/Image/hold-play.png"
        icon_released: player.playbackState == MediaPlayer.PlayingState ?  "qrc:/Image/play.png" : "qrc:/Image/pause.png"

        onClicked: {
            if (player.playbackState != MediaPlayer.PlayingState) {
                player.play()
            } else {
                player.pause()
            }
        }

        Connections {
            target: player
           function onPlaybackStateChanged() {
                if (player.playbackState == MediaPlayer.PlayingState) {
                    buttonPlayId.source = "qrc:/Image/pause.png"
                } else {
                    buttonPlayId.source = "qrc:/Image/play.png"
                }
            }
        }

    }

    ButtonControl {
         icon_default: "Image/next.png"
        icon_pressed: "Image/hold-next.png"
        icon_released: "Image/next.png"
        anchors.left: buttonPlayId.right
        onClicked: {
            if (playlist.currentIndex >= (playlist.count - 1)) {
                playlist.currentIndex = playlist.count - 1;
            } else {
                playlist.currentIndex++;
            }
        }
    }


    SwitchButton {
        icon_on: "Image/repeat.png"
        icon_off: "Image/repeat1_hold.png"
        Layout.alignment: Qt.AlignRight
        Layout.rightMargin: 140
        onClicked: {
            player.repeater = !player.repeater
        }
    }
}


