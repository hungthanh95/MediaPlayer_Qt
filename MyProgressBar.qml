import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

Item {
    id: myProgressBar
    Text {
        id: currentTime
        color: "white"
        font.pointSize: 17
        text: myPlayer.getTimeInfo(player.position)
        anchors.right: sliderBar.left
        anchors.rightMargin: 20
    }

    Slider{
        id: sliderBar
        width: 1491 - 675 * drawer.position
        anchors.horizontalCenter: parent.horizontalCenter

        from: 0
        to: player.duration
        value: player.position
        background: Rectangle {
            x: sliderBar.leftPadding
            y: sliderBar.topPadding + sliderBar.availableHeight / 2 - height / 2
            implicitWidth: 200
            implicitHeight: 4
            width: sliderBar.availableWidth
            height: implicitHeight
            radius: 2
            color: "gray"

            Rectangle {
                width: sliderBar.visualPosition * parent.width
                height: parent.height
                color: "white"
                radius: 2
            }
        }
        handle: Image {
            anchors.verticalCenter: parent.verticalCenter
            x: sliderBar.leftPadding + sliderBar.visualPosition * (sliderBar.availableWidth - width)
            y: sliderBar.topPadding + sliderBar.availableHeight / 2 - height / 2
            source: "qrc:/Image/point.png"
            Image {
                anchors.centerIn: parent
                source: "qrc:/Image/center_point.png"
            }
        }
        onMoved: {
            if (player.seekable){
                player.setPosition(value);
            }
        }
    }


    Text {
        id: totalTime
        color: "white"
        text: myPlayer.getTimeInfo(player.duration)
        font.pointSize: 17
        anchors.left: sliderBar.right
        anchors.leftMargin: 30
    }

    function str_pad_left(string,pad,length) {
        return (new Array(length+1).join(pad)+string).slice(-length);
    }

    function getTime(time){
        time = time/1000
        var minutes = Math.floor(time / 60);
        var seconds = Math.floor(time - minutes * 60);

        return str_pad_left(minutes,'0',2)+':'+str_pad_left(seconds,'0',2);
    }
}
