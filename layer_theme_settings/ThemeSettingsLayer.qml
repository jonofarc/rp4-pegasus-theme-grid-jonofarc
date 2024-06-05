import QtQuick 2.0
import "qrc:/qmlutils" as PegasusUtils


FocusScope {
    id: root

    signal closeRequested

    Keys.onPressed: {
        if (event.isAutoRepeat)
            return;

        if (api.keys.isCancel(event) || api.keys.isFilters(event)) {
            event.accepted = true;
            closeRequested();
        }
    }

    Rectangle {
        id: shade
        anchors.fill: parent

        color: "#000"
        opacity: 0
        Behavior on opacity { NumberAnimation { duration: 400 } }

        PegasusUtils.HorizontalSwipeArea {
            anchors.fill: parent
            enabled: panel.visible
            onClicked: closeRequested()
            // onSwipeDown: closeRequested()
        }
    }

    ThemeSettingsPanel {
        id: panel
        z: 400
        focus: true
        anchors {
            right: parent.left
            bottom: parent.bottom
        }
        visible: false
        MouseArea {
            anchors.fill: parent
            enabled: panel.visible
        }
    }


    states: [
        State {
            name: "open"; when: root.focus
            PropertyChanges { target: shade; opacity: 0.25 }
            AnchorChanges {
                target: panel
                anchors.left: parent.left
                anchors.right: undefined
            }
        }
    ]
    transitions: [
        Transition {
            to: "open"
            onRunningChanged: {
                if (running)
                    panel.visible = true;
            }
            AnchorAnimation { duration: 500; easing.type: Easing.OutCubic }
        },
        Transition {
            from: "open"
            onRunningChanged: {
                if (!running)
                    panel.visible = false;
            }
            AnchorAnimation { duration: 300; easing.type: Easing.OutCubic }
        }
    ]
}
