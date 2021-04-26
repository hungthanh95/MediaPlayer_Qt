import QtQuick 2.12

MouseArea {
    id: root
    property string icon_on: "Image/shuffle.png"
    property string icon_off: "Image/shuffle-1.png"
    property bool status: false

    implicitWidth: img.width
    implicitHeight: img.height

    Image {
        id: img
        source: root.status ? root.icon_off : root.icon_on
    }

    onClicked: {
        root.status = !root.status
    }
}

