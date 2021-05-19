import QtQuick 2.12


MouseArea {
    id: root
    property string icon_on: ""
    property string icon_off: ""
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

