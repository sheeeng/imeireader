// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import com.nokia.meego 1.1 // for MeeGo 1.2 Harmattan components. See http://harmattan-dev.nokia.com/docs/library/html/qt-components/qt-components.html page.
import QtMobility.systeminfo 1.2 // See http://harmattan-dev.nokia.com/docs/library/html/guide/html/Developer_Library_Best_practices_for_application_development_Optimising_power_consumption_Using_heartbeat.html page.

Page {
    id: mainPage
    orientationLock: PageOrientation.LockPortrait; // lock the screen orientation to portrait.

    AboutDialog {
        id: aboutDialog
    }

    function showAboutDialog(){
        aboutDialog.open()
    }

    ConfirmCloseDialog {
        id: confirmCloseDialog;
    }

    function showConfirmCloseDialog(){
        confirmCloseDialog.open();
    }

    DeviceInfo {
        id: deviceInfo
    }

    Label {
        text: qsTr("IMEI: ") + deviceInfo.imei + "\n"
              + qsTr("Manufacturer: ") + deviceInfo.manufacturer + "\n"
              + qsTr("Model: ") + deviceInfo.model + "\n"
              + qsTr("Product Name: ") + deviceInfo.productName + "\n"
              + qsTr("Unique Device ID: ") + deviceInfo.uniqueDeviceID;
    }

    tools: ToolBarLayout {
        id: toolbar
        ToolIcon {
            iconId: "icon-m-toolbar-close"; //"toolbar-back";
            enabled: true;
            onClicked: showConfirmCloseDialog(); //Qt.quit(); //pageStack.pop();
        }
        ToolIcon {
            platformIconId: "toolbar-select-text" // See http://wiki.meego.com/Harmattan_icons page.
            //iconId: theme.inverted ? "icon-m-toolbar-select-text-white" : "icon-m-toolbar-select-text";
            onClicked: {
                theme.inverted = !theme.inverted;
                Settings.themeInverted = theme.inverted;
                console.log((theme.inverted ? "Theme inverted." : "Theme not inverted."));
                console.log((Settings.themeInverted ? "Settings.themeInverted inverted." : "Settings.themeInverted not inverted."));
            }
        }
        ToolButton {
            id: detailsButton
            flat: false
            text: "About"
            onClicked: showAboutDialog();
        }
        ToolIcon {
            iconId: "toolbar-view-menu";
            platformIconId: "toolbar-view-menu";
            anchors.right: parent === undefined ? undefined : parent.right;
            onClicked: (helpMenu.status === DialogStatus.Closed) ? helpMenu.open() : helpMenu.close()
        }
    }
    Menu {
        id: helpMenu
        visualParent: mainPage
        MenuLayout {
            MenuItem { text: "About"; onClicked: showAboutDialog(); }
            MenuItem {
                text: "Website";
                property string acid3TestLink: "http://acid3.acidtests.org/";
                onClicked: {
                    Qt.openUrlExternally(acid3TestLink);
                    aboutDialog.accept();
                }
            }
            MenuItem {
                text: "Exit";
                onClicked: {
                    showConfirmCloseDialog(); //Qt.quit();
                }
            }
        }
    }
}
