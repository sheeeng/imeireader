// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import com.nokia.symbian 1.1 // See http://doc.qt.nokia.com/qt-components-symbian/index.html page.

PageStackWindow {
    id: rootPageStackWindow;

    Component.onCompleted: {
        console.log("PageStackWindow onCompleted.");
        console.log((platformInverted ? "Theme inverted." : "Theme not inverted."));
        console.log((Settings.themeInverted ? "Settings.themeInverted inverted." : "Settings.themeInverted not inverted."));
        platformInverted = Settings.themeInverted; // read settings upon startup
    }

    initialPage: MainPage {
        id: mainPage;
    }
}
