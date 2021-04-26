
import QtQuick 2.12
import QtQuick.Layouts 1.12

RowLayout {

    Image {
        id: thumbnailLeftId
        Layout.alignment: Qt.AlignLeft
        source: "Image/Bui-Anh-Tuan.png"
        Layout.leftMargin: 70
    }

    Image {
        id: thumbnailCenterId
        Layout.alignment: Qt.AlignHCenter
        source: "Image/Hongkong1.png"
    }


    Image {
        id: thumbnailRightId
        Layout.alignment: Qt.AlignRight
        source: "Image/Ha-Anh-Tuan.png"
        Layout.rightMargin: 70
    }
}
