import QtQuick 2.0
import "../configs.js" as CONFIGS
import "../constants.js" as CONSTANTS

Rectangle {
    id: supportContainer
    property var game
    property bool isDetailsActive
    // color: '#cc00cc00'
    color: '#00000000'
    width: parent.width * 0.34 - 1
    height: supportimg.height + (supportimg.source != '' ? 20 : 0)
    opacity: api.memory.get(CONSTANTS.HIDE_SUPPORT) ? 0 : 1

    Image {
        id: boximg
        opacity: 0
        width: parent.width - 20
        height:  parent.parent.height - 57 - supportimg.height
        anchors {
            right: parent.right
            top: parent.top

            rightMargin: 10
            topMargin: 10
        }
        verticalAlignment: Image.AlignTop

        asynchronous: true
        source: game && game.assets ? game.assets.boxFront : ""
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: supportimg
        width: parent.width - 20
        anchors {
            right: parent.right
            bottom: parent.bottom

            rightMargin: 10
            bottomMargin: 10
        }
        verticalAlignment: Image.AlignBottom

        asynchronous: true
        source: game && game.assets ? game.assets.cartridge : ""
        fillMode: Image.PreserveAspectFit
    }
    // Text {
    //     color: 'white'
    //     text: 'isDetailsActive: '+JSON.stringify(anchors.top)
    // }
    states: [
        State {
            name: "open"
            when: isDetailsActive
            PropertyChanges {
                target: supportContainer
                height: parent.height - 27
                color: "#FF111111"
                opacity: 1
            }
            PropertyChanges {
                target: boximg
                opacity: 1
            }
        }
    ]
    transitions: [
        Transition {
            to: "open"
            PropertyAnimation { properties: "color,height,opacity"; duration: 300; easing.type: Easing.OutCubic }
        },
        Transition {
            from: "open"
            PropertyAnimation { properties: "color,height,opacity"; duration: 300; easing.type: Easing.OutCubic }
        }
    ]
}
