// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import com.nokia.meego 1.1 // for MeeGo 1.2 Harmattan components. See http://harmattan-dev.nokia.com/docs/library/html/qt-components/qt-components.html page.
import com.nokia.extras 1.1 // See http://harmattan-dev.nokia.com/docs/library/html/qt-components-extras/qt-components-extras.html?tab=3&q=components&sp=all page.
import QtMobility.systeminfo 1.2 // See http://harmattan-dev.nokia.com/docs/library/html/guide/html/Developer_Library_Best_practices_for_application_development_Optimising_power_consumption_Using_heartbeat.html page.

Page {
    id: mainPage;
    orientationLock: PageOrientation.LockPortrait; // lock the screen orientation to portrait.

    AboutDialog {
        id: aboutDialog;
    }

    function showAboutDialog(){
        aboutDialog.open();
    }

    ConfirmCloseDialog {
        id: confirmCloseDialog;
    }

    function showConfirmCloseDialog(){
        confirmCloseDialog.open();
    }

    DeviceInfo {
        id: deviceInfo;
    }

    Label {
        id: labelImeiAbbreviation;
        text: qsTr("IMEI");
        //font: UiConstants.TitleFont; // See http://harmattan-dev.nokia.com/docs/library/html/qt-components/qt-components-meego-interfaceguide.html page.
        font.family: "Nokia Pure";
        font.pixelSize: 48;
        font.bold: true;
        color: "ivory";
        width: parent.width;
        horizontalAlignment: Text.AlignHCenter;
        anchors.bottom: labelImei.top;
        anchors.margins: 5;
    }

    Label {
        id: labelImei;
        text: qsTr("International Mobile\nEquipment Identity");
        //font: UiConstants.SmallTitleFont; // See http://harmattan-dev.nokia.com/docs/library/html/qt-components/qt-components-meego-interfaceguide.html page.
        font.family: "Nokia Pure";
        font.pointSize: 24;
        font.bold: true;
        font.italic: true;
        opacity: 0.6; // See http://doc.qt.nokia.com/4.7-snapshot/qml-item.html#opacity-prop page.
        color: "ivory";
        width: parent.width;
        horizontalAlignment: Text.AlignHCenter;
        anchors.bottom: textInputImeiDisplay.top;
        anchors.bottomMargin: 40;
    }

    TextInput {
        id: textInputImeiDisplay;
        anchors.centerIn: parent;
        anchors.margins: -10;
        readOnly: true;
        font.family: "Nokia Pure";
        font.pixelSize: 48;
        font.bold: true;
        width: parent.width;
        horizontalAlignment: Text.AlignHCenter;
        //font.family: platformStyle.fontFamily
        //font.pixelSize: UiConstants.HeaderFont // See http://harmattan-dev.nokia.com/docs/library/html/qt-components/qt-components-meego-interfaceguide.html page.
        //font.pixelSize: platformStyle.fontPixelSize

        color: "white"; //platformStyle.textColor
        selectionColor: "transparent";
        text: deviceInfo.imei;
        MouseArea {
            anchors.fill: textInputImeiDisplay
            onClicked: {
                copyImei();
            }
        }
    }

    Label {
        id: labelTapImeiToCopy;
        text: qsTr("Tap on IMEI number to copy it.");
        //font: UiConstants.SmallTitleFont; // See http://harmattan-dev.nokia.com/docs/library/html/qt-components/qt-components-meego-interfaceguide.html page.
        font.family: "Nokia Pure";
        font.pointSize: 24;
        font.bold: true;
        font.italic: true;
        opacity: 0.6; // See http://doc.qt.nokia.com/4.7-snapshot/qml-item.html#opacity-prop page.
        color: "azure";
        width: parent.width;
        horizontalAlignment: Text.AlignHCenter;
        anchors.top: textInputImeiDisplay.bottom;
        anchors.topMargin: 20;
    }

    function copyImei() {
        textInputImeiDisplay.selectAll();
        textInputImeiDisplay.copy();
        showBannerImeiCopied();
    }

    InfoBanner {
        // See http://harmattan-dev.nokia.com/docs/library/html/qt-components-extras/qt-components-meego-extrasinfobanner.html?tab=3&q=components&sp=all page.
        id: infoBannerCopied;
        text: qsTr("The IMEI number has been copied.");
        iconSource: "image://theme/icon-m-toolbar-attachment"; //See http://wiki.meego.com/Harmattan_icons page.
    }

    function showBannerImeiCopied() {
        infoBannerCopied.timerShowTime = 2000; // default is 3000 ms
        infoBannerCopied.show();
    }

    tools: ToolBarLayout {
        id: toolbar
        ToolIcon {
            iconId: "icon-m-toolbar-close"; //"toolbar-back";
            enabled: true;
            onClicked: showConfirmCloseDialog(); //Qt.quit(); //pageStack.pop();
        }
        ToolIcon {
            platformIconId: "toolbar-select-text"; // See http://wiki.meego.com/Harmattan_icons page.
            //iconId: theme.inverted ? "icon-m-toolbar-select-text-white" : "icon-m-toolbar-select-text";
            onClicked: {
                theme.inverted = !theme.inverted;
                Settings.themeInverted = theme.inverted;
                console.log((theme.inverted ? "Theme inverted." : "Theme not inverted."));
                console.log((Settings.themeInverted ? "Settings.themeInverted inverted." : "Settings.themeInverted not inverted."));
            }
        }
        ToolButton {
            id: buttonCopy;
            flat: false;
            text: qsTr("Copy");
            onClicked: copyImei();
        }
        ToolIcon {
            iconId: "toolbar-view-menu";
            platformIconId: "toolbar-view-menu";
            anchors.right: parent === undefined ? undefined : parent.right;
            onClicked: (helpMenu.status === DialogStatus.Closed) ? helpMenu.open() : helpMenu.close();
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
