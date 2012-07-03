/****************************************************************************
**
**  This file belongs to ImeiReader application.
**  See https://bitbucket.org/sheeeng/imeireader/wiki/Home page.
**  Copyright (C) 2012 Leonard Lee <sheeeng@gmail.com>
**
**  This program is free software: you can redistribute it and/or modify
**  it under the terms of the GNU General Public License as published by
**  the Free Software Foundation, either version 3 of the License, or
**  (at your option) any later version.

**  This program is distributed in the hope that it will be useful,
**  but WITHOUT ANY WARRANTY; without even the implied warranty of
**  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
**  GNU General Public License for more details.

**  You should have received a copy of the GNU General Public License
**  along with this program.  If not, see <http://www.gnu.org/licenses/>.
**
****************************************************************************/

// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
// MeeGo 1.2 Harmattan PR1.1 (20.2011.40-4_PR_001) uses com.nokia.meego 1.0
import com.nokia.meego 1.0 // for MeeGo 1.2 Harmattan components. See http://harmattan-dev.nokia.com/docs/library/html/qt-components/qt-components.html page.

PageStackWindow {
    id: rootPageStackWindow;

    Component.onCompleted: {
        //console.log("PageStackWindow onCompleted.");
        //console.log((theme.inverted ? "Theme inverted." : "Theme not inverted."));
        //console.log((Settings.themeInverted ? "Settings.themeInverted inverted." : "Settings.themeInverted not inverted."));
        theme.inverted = Settings.themeInverted; // read settings upon startup
        //theme.color = 12; // See http://www.meegoexperts.com/2011/09/qml-colour-themes-meego-harmattan/ and http://forum.meego.com/showthread.php?t=4387 pages.
    }

    Component.onDestruction: {
        //Settings.themeInverted = theme.inverted; // write settings upon exit will give segmentation fault in PageStackWindow
        //console.log("Page onDestruction.");
    }

    platformStyle: PageStackWindowStyle {
        background: theme.inverted ? "qrc:/backgrounds/images/pattern_154.gif" : "qrc:/backgrounds/images/pattern_157.gif"; // See http://www.squidfingers.com/patterns page.
        landscapeBackground: theme.inverted ? "qrc:/backgrounds/images/pattern_154.gif" : "qrc:/backgrounds/images/pattern_157.gif"; // See http://www.squidfingers.com/patterns page.
        portraitBackground: theme.inverted ? "qrc:/backgrounds/images/pattern_154.gif" : "qrc:/backgrounds/images/pattern_157.gif"; // See http://www.squidfingers.com/patterns page.
        backgroundFillMode: Image.Tile;
    }

    initialPage: MainPage {
        id: mainPage;
    }
}
