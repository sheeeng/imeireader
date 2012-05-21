// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import com.nokia.meego 1.1 // for MeeGo 1.2 Harmattan components. See http://harmattan-dev.nokia.com/docs/library/html/qt-components/qt-components.html page.

Dialog {
    id: confirmCloseDialog

    title: Column {
        id: titleSection
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 16

        Image {
            anchors.horizontalCenter: parent.horizontalCenter
            //source: "http://qt.nokia.com/images/products/qt-logo"
            source: "image://theme/icon-l-gallery"
            width: 128;
            height: 128;
            fillMode: Image.PreserveAspectFit
            smooth: true
        }

        Text {
            id: titleText
            width: parent.width
            horizontalAlignment : Text.AlignHCenter
            font.pixelSize: 28
            color: "white"
            font.family: "Nokia Pure"
            text: "Close this application?"
        }

        Rectangle {
            id: titleBottom
            width: 256;
            height: 3;
            color: "#93c169" //color in Qt logo.
        }
    }

    content: Column {
        id: contentSection
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 16

        Rectangle {
            id: contentTop
            anchors.horizontalCenter: parent.horizontalCenter
            width: 256;
            height: 3;
            color: "#00ffff00" //full transparent
            //color: "#7bffff00" //half transparent.
        }

        Rectangle {
            id: contentBottom
            anchors.horizontalCenter: parent.horizontalCenter
            width: 256;
            height: 3;
            color: "#00ffff00" //full transparent
            //color: "#7bffff00" //half transparent.
        }
    }

    buttons: Column {
        id: buttonsSection
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 16

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
