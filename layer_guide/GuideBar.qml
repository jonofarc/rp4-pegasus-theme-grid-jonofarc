import QtQuick 2.0
import "../."
// import "../configs.js" as CONFIGS
// keep colours static for now ;D

Rectangle {
    id: guideBar
    Timer {
        //id: onStartShowControllerHints
        interval: 3000
        running: true
        onTriggered: {
            Globals.guideHintsAreVisible = false
            // parent.color = "#88FF1111"
        }
    }
    function toggleHelp() {
        Globals.guideHintsAreVisible = !Globals.guideHintsAreVisible
    }
    color: "#88111111"
    height: 34

    ButtonHint {
        id: square
        hint: 'Game menu'
        icon: '2'
        anchors {
            left: parent.left
        }
    }

    ButtonHint {
        id: triangle
        hint: 'Filter'
        icon: '3'
        anchors {
            left: square.right
        }
    }

    ButtonHint {
        id: cross
        hint: 'Settings'
        icon: '0'
        anchors {
            left: triangle.right
        }
    }

    ButtonHint {
        id: start
        hint: 'Pegasus'
        icon: '11'
        anchors {
            right: circle.left
        }
    }
    ButtonHint {
        id: circle
        hint: 'Run game'
        icon: '1'
        anchors {
            right: parent.right
        }
    }

    states: State {
        name: "hidden"
        when: !Globals.guideHintsAreVisible
        PropertyChanges { target: guideBar; height: 0 }
    }
    transitions: Transition {
        NumberAnimation { properties: 'height'; duration: 800 }
    }
}
