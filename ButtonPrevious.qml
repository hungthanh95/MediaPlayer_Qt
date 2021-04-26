import QtQuick 2.12


MouseArea {
    id: root

    property string icon_default: "Image/prev.png"
    property string icon_pressed: "Image/hold-prev.png"

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
