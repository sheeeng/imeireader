// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import com.nokia.symbian 1.1 // See http://doc.qt.nokia.com/qt-components-symbian/index.html page.

CommonDialog {
    id: aboutDialog;

    titleText: qsTr("About ") + ApplicationNameImeiReader;
    titleIcon: "qrc:/images/ImeiReader.svg"

    content: Column {
        id: contentSection;
        anchors.horizontalCenter: parent.horizontalCenter;
        spacing: 5;

        Text {
            id: text;
            wrapMode: Text.WordWrap;
            color: "white";
            elide: Text.ElideNone;
            horizontalAlignment: Text.AlignHCenter;
            text:  qsTr("<br/>")
                   + qsTr("Displays the IMEI number.") + qsTr("<br/>")
                   + qsTr("<br/>")
                   + qsTr("Leonard Lee") + qsTr("<br/>")
                   + qsTr("sheeeng@gmail.com") + qsTr("<br/>")
                   + qsTr("<br/>");
        }
    }

    buttons: ButtonRow {
        id: buttonsSection;
        spacing: 16;
        anchors.horizontalCenter: parent.horizontalCenter;
        Button {
            text: qsTr("Close");
            onClicked: aboutDialog.accept();
        }
    }
}
