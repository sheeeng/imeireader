// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import com.nokia.symbian 1.1 // See http://doc.qt.nokia.com/qt-components-symbian/index.html page.

QueryDialog {
    id: confirmCloseDialog;

    titleText: qsTr("Exit");
    message : qsTr("Close this application?");
    height: 120; // explicitly needed to set this height to show message.

    acceptButtonText :  qsTr("Yes");
    rejectButtonText :  qsTr("No");

    onAccepted: Qt.quit();
}
