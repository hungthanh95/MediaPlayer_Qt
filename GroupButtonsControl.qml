import QtQuick 2.12
import QtQuick.Layouts 1.12

RowLayout {
    id: groupButtonsControlId
    RepeatButton {
        Layout.alignment: Qt.AlignLeft
        Layout.leftMargin: 140
    }

    ButtonPrevious {
        anchors.right: buttonPlayId.left
    }

    ButtonPlay {
        id: buttonPlayId
        Layout.alignment: Qt.AlignHCenter
    }
    ButtonNext {
        anchors.left: buttonPlayId.right
    }
    ButtonShuffle {
        Layout.alignment: Qt.AlignRight
        Layout.rightMargin: 140
    }
}


