import QtQuick 2.0

Row {
    id: root

    property alias fontSize: labeltext.font.pixelSize
    property alias value: currentValue.text
    property alias label: labeltext.text
    property alias textColor: labeltext.color
    property var model: []

    signal valueChange

    // private
    property var model_i: value ? model.indexOf(value): 0


    Keys.onLeftPressed: {
        event.accepted = true;
        model_i = model_i == 0 ? model.length - 1 : model_i - 1
        value = model[model_i]
        valueChange()
    }
    Keys.onRightPressed: {
        event.accepted = true;
        model_i = model_i == model.length - 1 ? 0 : model_i + 1
        value = model[model_i]
        valueChange()
    }

    Rectangle {
        id: slider
        width: 150
        height: parent.fontSize * 1.4

        color: "#50000000"
        border.color: "#60000000"
        border.width: vpx(1)

        anchors {
            verticalCenter: parent.verticalCenter
            rightMargin: 5
        }

        Text {
            id: arrowleft
            color: "#60000000"
            font {
                bold: true
                pixelSize: parent.height * 0.7
            }
            verticalAlignment: Text.AlignVCenter

            anchors {
                top: parent.top
                topMargin:1
                left: parent.left
                leftMargin: 5
            }
            text: '<'
        }
        Text {
            id: currentValue

            height: parent.height
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter

            color: "#eee"
            anchors {
                left: arrowleft.right
                right: arrowright.left
                leftMargin: 5
                rightMargin: 5
            }
            font {
                bold: root.activeFocus
            }
        }
        Text {
            id: arrowright
            color: arrowleft.color
            font: arrowleft.font

            anchors {
                top: arrowleft.anchors.top
                topMargin: arrowleft.anchors.topMargin
                right: parent.right
                rightMargin: 5
            }
            text: '>'
        }
    }

    Text {
        id: labeltext

        height: parent.height
        verticalAlignment: Text.AlignVCenter

        color: "#eee"
        font {
            bold: root.activeFocus
        }
        // anchors {
        //     leftMargin: 5
        // }
    }
}
