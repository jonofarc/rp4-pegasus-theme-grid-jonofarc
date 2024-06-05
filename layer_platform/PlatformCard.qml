// Pegasus Frontend
// Copyright (C) 2017-2018  Mátyás Mustoha
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program. If not, see <http://www.gnu.org/licenses/>.


import QtQuick 2.0
import "../configs.js" as CONFIGS
import QtGraphicalEffects 1.0

Item {
    property alias platformShortName: label.text
    property bool isOnTop: false

    clip: true

    Rectangle {
        id: main
        width: parent.width * 0.8
        height: parent.height
        color: CONFIGS.getMainColour(api)
    }

    Rectangle {
        width: main.height * 1.7
        height: width
        color: main.color
        rotation: -70
        anchors.verticalCenter: parent.top
        anchors.horizontalCenter: main.right
        anchors.horizontalCenterOffset: vpx(-27)

        Text {
            id: label
            width: 0
            text: ""
            color: parent.parent.isOnTop ? CONFIGS.getForegroundColour(api) : CONFIGS.getForegroundGrey(api)
            anchors {
                left: parent.left
                bottom: parent.bottom
                leftMargin: vpx(8)
                bottomMargin: vpx(4)
            }
            font {
                bold: true
                capitalization: Font.AllUppercase
                pixelSize: vpx(16)
                family: globalFonts.condensed
            }
        }

        Rectangle {
            color: parent.parent.isOnTop ? CONFIGS.getForegroundColour(api) : CONFIGS.getForegroundGrey(api)
            width: parent.width
            height: vpx(2)
            anchors.top: parent.bottom
            anchors.left: parent.left
            antialiasing: true
        }
    }

    Image {
        id: platformimg
        source: "../assets/logos/" + platformShortName + ".svg"
        sourceSize.height: 100
        fillMode: Image.PreserveAspectFit

        asynchronous: true

        width: parent.width * 0.6
        height: parent.height - vpx(12)
        anchors.bottom: parent.bottom
        anchors.bottomMargin: vpx(6)
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.horizontalCenterOffset: vpx(-32)

        Text {
            text: platformShortName
            color: parent.isOnTop ? CONFIGS.getForegroundColour(api) : CONFIGS.getForegroundGrey(api)
            anchors.fill: parent
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
            visible: parent.status != Image.Ready
            font.bold: true
            font.capitalization: Font.AllUppercase
            font.pixelSize: vpx(36)
            font.family: globalFonts.condensed
        }
    }


    ColorOverlay {
        anchors.fill: platformimg
        source: platformimg
        color: parent.isOnTop ? CONFIGS.getForegroundColour(api) : CONFIGS.getForegroundGrey(api)
    }
}
