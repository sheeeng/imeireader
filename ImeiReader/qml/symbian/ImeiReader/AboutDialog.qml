// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import com.nokia.symbian 1.1 // See http://doc.qt.nokia.com/qt-components-symbian/index.html page.

CommonDialog {
    id: aboutDialog;

    titleText: qsTr("About ") + ApplicationNameImeiReader;

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
            text:  String("<br/>")
                   + "Displays the IMEI number." + String("<br/>")
                   + String("<br/>")
                   + String("Leonard Lee") + String("<br/>")
                   + "sheeeng@gmail.com" + String("<br/>")
                   + String("<br/>");
        }
    }

    buttons: ButtonRow {
        id: buttonsSection;
        anchors.horizontalCenter: parent.horizontalCenter;
        Button {
            text: "Close";
            onClicked: aboutDialog.accept();
        }
    }
}
