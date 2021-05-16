import QtQuick 2.0
import QtQml.Models 2.15

ListModel {
    id: playlistModel
    ListElement {
        title: "Phố Không Mùa"
        singer: "Bùi Anh Tuấn"
        icon: "qrc:/Image/Bui-Anh-Tuan.png"
        source: "qrc:/Music/Pho-Khong-Mua-Duong-Truong-Giang-ft-Bui-Anh-Tuan.mp3"
    }
    ListElement {
        title: "Chuyện Của Mùa Đông"
        singer: "Hà Anh Tuấn"
        icon: "qrc:/Image/Ha-Anh-Tuan.png"
        source: "qrc:/Music/Chuyen-Cua-Mua-Dong-Ha-Anh-Tuan.mp3"
    }
    ListElement {
        title: "Hongkong1"
        singer: "Nguyễn Trọng Tài"
        icon: "qrc:/Image/Hongkong1.png"
        source: "qrc:/Music/Hongkong1-Official-Version-Nguyen-Trong-Tai-San-Ji-Double-X.mp3"
    }
}
