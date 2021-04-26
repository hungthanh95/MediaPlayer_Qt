import QtQuick 2.12
import QtQuick.Layouts 1.12

ColumnLayout {
    Header {
        id: headerId
    }
    RowLayout {
        width: parent.width
        Playlist {
            id: leftPanelId
            Component.onCompleted: {
                console.log("LeftPanel width: " + width)
                console.log("LeftPanel height: " + height)
            }
        }
        RightPanel {
            width: parent.width - leftPanelId.width
            height: leftPanelId.height
            Component.onCompleted: {
                console.log("RightPanel width: " + width)
                console.log("RightPanel height: " + height)
            }
        }
    }
    Component.onCompleted: {
        console.log("Main width: " + width)
        console.log("Main height: " + height)
    }
}
