// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import com.nokia.meego 1.1 // for MeeGo 1.2 Harmattan components. See http://harmattan-dev.nokia.com/docs/library/html/qt-components/qt-components.html page.

PageStackWindow {
    id: rootPageStackWindow

    Component.onCompleted: {
        console.log("PageStackWindow onCompleted.");
        console.log((theme.inverted ? "Theme inverted." : "Theme not inverted."));
        console.log((Settings.themeInverted ? "Settings.themeInverted inverted." : "Settings.themeInverted not inverted."));
        theme.inverted = Settings.themeInverted; // read settings upon startup
        //theme.color = 12 // See http://www.meegoexperts.com/2011/09/qml-colour-themes-meego-harmattan/ and http://forum.meego.com/showthread.php?t=4387 pages.
    }

    Component.onDestruction: {
        //Settings.themeInverted = theme.inverted; // write settings upon exit will give segmentation fault in PageStackWindow
        console.log("Page onDestruction.");
    }

    platformStyle: PageStackWindowStyle {
        background: theme.inverted ? "qrc:/background/images/pattern_154.gif" : "qrc:/background/images/pattern_157.gif"; //Credit for http://www.squidfingers.com/patterns page.
        landscapeBackground: theme.inverted ? "qrc:/background/images/pattern_154.gif" : "qrc:/background/images/pattern_157.gif"; //Credit for http://www.squidfingers.com/patterns page.
        portraitBackground: theme.inverted ? "qrc:/background/images/pattern_154.gif" : "qrc:/background/images/pattern_157.gif"; //Credit for http://www.squidfingers.com/patterns page.
        backgroundFillMode: Image.Tile
    }

    initialPage: MainPage {
        id: mainPage
    }
}
