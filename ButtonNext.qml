import QtQuick 2.12


MouseArea {
    id: root
    property string icon_default: "Image/next.png"
    property string icon_pressed: "Image/hold-next.png"

    implicitWidth: img.width
    implicitHeight: img.height

    Image {
        id: img
        source: icon_default
    }

    onPressed: {
        img.source = icon_pressed
    }

    onReleased: {
        img.source = icon_default
    }
}

