// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import com.nokia.meego 1.1 // for MeeGo 1.2 Harmattan components. See http://harmattan-dev.nokia.com/docs/library/html/qt-components/qt-components.html page.

Dialog {
    id: aboutDialog;

    title: Column {
        id: titleSection;
        anchors.horizontalCenter: parent.horizontalCenter;
        spacing: 5;

        Image {
            anchors.horizontalCenter: parent.horizontalCenter;
            //source: "http://qt.nokia.com/images/products/qt-logo";
            source: "image://theme/icon-l-gallery";
            width: 128;
            height: 128;
            fillMode: Image.PreserveAspectFit;
            smooth: true;
        }

        Text {
            id: titleText;
            width: parent.width;
            horizontalAlignment : Text.AlignHCenter;
            font.pixelSize: 28;
            color: "white";
            font.family: "Nokia Pure";
            text: qsTr("About ") + ApplicationNameImeiReader;
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
        spacing: 5;

        Text {
            id: text;
            wrapMode: Text.WordWrap;
            font.pointSize: 20;
            color: "white";
            font.family: "Nokia Pure";
            elide: Text.ElideNone;
            horizontalAlignment: Text.AlignHCenter;
            text:  String("<br/>")
                   + "Displays the IMEI number." + String("<br/>")
                   + String("<br/>")
                   + String("Leonard Lee") + String("<br/>")
                   + "sheeeng@gmail.com" + String("<br/>")
                   + String("<br/>");
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
            text: "Website";
            property string acid3TestLink: "http://acid3.acidtests.org/";
            onClicked: {
                Qt.openUrlExternally(acid3TestLink);
                aboutDialog.accept();
            }
        }
        Button {
            text: "Close";
            onClicked: aboutDialog.accept();
        }
    }
}
