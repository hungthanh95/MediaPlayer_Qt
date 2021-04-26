import QtQuick 2.12


MouseArea {
    id: root
    property string icon_on: "Image/repeat.png"
    property string icon_off: "Image/repeat1_hold.png"
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

