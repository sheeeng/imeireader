// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import com.nokia.symbian 1.1 // See http://doc.qt.nokia.com/qt-components-symbian/index.html page.
import com.nokia.extras 1.1 // See http://doc.qt.nokia.com/qt-components-symbian/index.html page.
import QtMobility.systeminfo 1.2 // See http://doc.qt.nokia.com/qtmobility/quickstart.html page.

Page {
    id: mainPage;
    orientationLock: PageOrientation.LockPortrait; // lock the screen orientation to portrait.

    Component.onCompleted: {
        //console.log("PageStackWindow onCompleted.");
        //console.log((platformInverted ? "onCompleted - Theme inverted." : "Theme not inverted."));
        //console.log((Settings.themeInverted ? "onCompleted - Settings.themeInverted inverted." : "Settings.themeInverted not inverted."));
    }

    Image { // See http://qt-project.org/doc/qt-4.8/qml-image.html page.
        id: imageBackground;
        anchors.fill: parent;
        source: Settings.themeInverted ? "qrc:/background/images/pattern_154.gif" : "qrc:/background/images/pattern_157.gif"; // See http://www.squidfingers.com/patterns page.
        fillMode: Image.Tile;
    }

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
        font.family: "Nokia Pure";
        font.pixelSize: 36;
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
        font.pixelSize: 36;
        font.bold: true;
        width: parent.width-10;
        horizontalAlignment: Text.AlignHCenter;
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
        id: infoBannerCopied;
        text: qsTr("The IMEI number has been copied."); //See http://doc.qt.nokia.com/qt-components-symbian/qml-infobanner.html page.
    }

    function showBannerImeiCopied() {
        infoBannerCopied.timeout = 2000; // default is 3000 ms
        infoBannerCopied.open();
    }

    ToolBar {
        id: toolbar
        anchors.bottom: parent.bottom
        platformInverted: !Settings.themeInverted; // It's dark theme by default on Symbian Belle platform.
        tools: ToolBarLayout {
            // See list of icons on Symbian at http://qt.gitorious.org/qt-components/qt-components/blobs/d1ee37d5da0cecf58c2729d55e296e349c3a1d7d/doc/src/snippets/symbian/snippet-toolbar-icons.qml page.
            ToolButton {
                id: backButton
                iconSource: "toolbar-back"; // See http://doc.qt.nokia.com/qt-components-symbian/qml-toolbarlayout.html page.
                enabled: true;
                onClicked: showConfirmCloseDialog(); //Qt.quit(); //pageStack.pop();
            }
            ToolButton {
                id: toolButtonThemeInverted
                text: Settings.themeInverted ? qsTr("Light") : qsTr("Dark");
                checkable: true;
                checked: platformInverted;
                onCheckedChanged: {
                    platformInverted = !platformInverted; // See http://doc.qt.nokia.com/qtquick-components-symbian-1.1/inverted-style.html page.
                    Settings.themeInverted = platformInverted;
                    imageBackground.source = Settings.themeInverted ? "qrc:/background/images/pattern_154.gif" : "qrc:/background/images/pattern_157.gif"; // See http://www.squidfingers.com/patterns page.
                    toolButtonThemeInverted.text = Settings.themeInverted ? qsTr("Dark") : qsTr("Light");
                    //console.log((platformInverted? "onCheckedChanged - Theme inverted." : "Theme not inverted."));
                    //console.log((Settings.themeInverted ? "onCheckedChanged - Settings.themeInverted inverted." : "Settings.themeInverted not inverted."));
                }
            }
            ToolButton {
                id: buttonCopy;
                flat: false;
                text: qsTr("Copy");
                onClicked: copyImei();
            }
            ToolButton {
                iconSource: "toolbar-menu";
                anchors.right: parent === undefined ? undefined : parent.right;
                onClicked: (helpMenu.status === DialogStatus.Closed) ? helpMenu.open() : helpMenu.close();
            }
        }
    }
    Menu {
        id: helpMenu
        visualParent: mainPage
        MenuLayout {
            MenuItem { text: qsTr("About"); onClicked: showAboutDialog(); }
//            MenuItem {
//                text: qsTr("Website");
//                property string acid3TestLink: "http://acid3.acidtests.org/";
//                onClicked: {
//                    Qt.openUrlExternally(acid3TestLink);
//                    aboutDialog.accept();
//                }
//            }
            MenuItem {
                text: qsTr("Exit");
                onClicked: {
                    showConfirmCloseDialog(); //Qt.quit();
                }
            }
        }
    }
}
