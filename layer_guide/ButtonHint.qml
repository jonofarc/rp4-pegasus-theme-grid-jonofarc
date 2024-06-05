import QtQuick 2.0
import QtGraphicalEffects 1.0
import "../."
import "../constants.js" as CONSTANTS

Rectangle {
    id: hintitem
    property string hint: ''
    property string colour: ''
    property string backgroundcolour: "#00111111"
    property string icon: '1'
    property bool ignoreGlobalVisible: false
    property bool localVisible: true

    color: backgroundcolour

    height: 34
    width: iconimage.width+(hint ? hinttext.width+15 : 0)

    Image {
        id: iconimage
        source: "../assets/controller/" + icon + ".png"
        fillMode: Image.PreserveAspectFit

        asynchronous: true

        width: 24
        height: 24
        anchors {
            leftMargin: 5
            verticalCenter: parent.verticalCenter
        }
    }

    ColorOverlay {
        anchors.fill: iconimage
        source: iconimage
        color: colour || '#fff'
    }

    Text {
        id:hinttext
        text: hint
        color: colour || '#fff'
        font.pixelSize: CONSTANTS.FONT_SIZE
        anchors{
            left: iconimage.right
            verticalCenter: parent.verticalCenter
            leftMargin: hint ? 5 : 0
            rightMargin: hint ? 5 : 0
        }
    }

    states: State {
        name: "hidden"
        when: (!localVisible) || (!ignoreGlobalVisible && !Globals.guideHintsAreVisible)
        PropertyChanges { target: hintitem; opacity: 0 }
    }
    transitions: Transition {
        from: ""; to: "hidden"
        NumberAnimation { properties: 'opacity'; duration: 800 }
    }
}
