import QtQuick 2.12


MouseArea {
    id: root
    property string icon_default: "Image/play.png"
    property string icon_pressed: ""
    property string icon_released: ""
    property bool isPlay: false

    implicitWidth: img.width
    implicitHeight: img.height

    Image {
        id: img
        source: icon_default
    }

    onPressed: {
        if (isPlay) {
            icon_pressed = "Image/hold-pause.png"
        } else {
            icon_pressed = "Image/hold-play.png"
        }
        img.source = icon_pressed
        isPlay = !isPlay
    }

    onReleased: {
        if (isPlay === true) {
            icon_released = "Image/pause.png"
        } else {
            icon_released = "Image/play.png"
        }
        img.source = icon_released

    }
}

