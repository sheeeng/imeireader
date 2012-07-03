/****************************************************************************
**
**  This file belongs to ImeiReader application.
**  See https://bitbucket.org/sheeeng/imeireader/wiki/Home page.
**  Copyright (C) 2012 Leonard Lee <sheeeng@gmail.com>
**
**  This program is free software: you can redistribute it and/or modify
**  it under the terms of the GNU General Public License as published by
**  the Free Software Foundation, either version 3 of the License, or
**  (at your option) any later version.

**  This program is distributed in the hope that it will be useful,
**  but WITHOUT ANY WARRANTY; without even the implied warranty of
**  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
**  GNU General Public License for more details.

**  You should have received a copy of the GNU General Public License
**  along with this program.  If not, see <http://www.gnu.org/licenses/>.
**
****************************************************************************/

// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
// MeeGo 1.2 Harmattan PR1.1 (20.2011.40-4_PR_001) uses com.nokia.meego 1.0
import com.nokia.meego 1.0 // for MeeGo 1.2 Harmattan components. See http://harmattan-dev.nokia.com/docs/library/html/qt-components/qt-components.html page.

Dialog {
    id: confirmCloseDialog;

    title: Column {
        id: titleSection;
        anchors.horizontalCenter: parent.horizontalCenter;
        spacing: 16;

        Image {
            anchors.horizontalCenter: parent.horizontalCenter;
            //source: "http://qt.nokia.com/images/products/qt-logo";
            //source: "image://theme/icon-l-gallery";
            source: "qrc:/images/ImeiReader80.png"
            width: 80;
            height: 80;
            fillMode: Image.PreserveAspectFit;
            smooth: true;
        }

        Text {
            id: titleText;
            width: parent.width;
            horizontalAlignment: Text.AlignHCenter;
            font.pixelSize: 28;
            color: "white";
            font.family: "Nokia Pure";
            text: qsTr("Close this application?");
        }

        Rectangle {
            id: titleBottom;
            width: 256;
            height: 3;
            color: "#93c169"; //color in Qt logo.
        }
    }

    content: Column {
        id: contentSection;
        anchors.horizontalCenter: parent.horizontalCenter;
        spacing: 16;

        Rectangle {
            id: contentTop;
            anchors.horizontalCenter: parent.horizontalCenter;
            width: 256;
            height: 3;
            color: "#00ffff00"; //full transparent
            //color: "#7bffff00"; //half transparent
        }

        Rectangle {
            id: contentBottom;
            anchors.horizontalCenter: parent.horizontalCenter;
            width: 256;
            height: 3;
            color: "#00ffff00"; //full transparent
            //color: "#7bffff00"; //half transparent
        }
    }

    buttons: Column {
        id: buttonsSection;
        anchors.horizontalCenter: parent.horizontalCenter;
        spacing: 16;

        Button {
            text: qsTr("Yes");
            onClicked: {
                confirmCloseDialog.accept();
                Qt.quit();
            }
        }
        Button {
            text: qsTr("No");
            onClicked: confirmCloseDialog.reject();
        }
    }
}
