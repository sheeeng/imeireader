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
import com.nokia.symbian 1.1 // See http://doc.qt.nokia.com/qt-components-symbian/index.html page.

PageStackWindow {
    id: rootPageStackWindow;

    Component.onCompleted: {
        //console.log("PageStackWindow onCompleted.");
        //console.log((platformInverted ? "Theme inverted." : "Theme not inverted."));
        //console.log((Settings.themeInverted ? "Settings.themeInverted inverted." : "Settings.themeInverted not inverted."));
        platformInverted = Settings.themeInverted; // read settings upon startup
    }

    initialPage: MainPage {
        id: mainPage;
    }
}
