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

#include "settings.h"
#include <QSettings>
//#include <QTime>
#include <QDebug>

Settings::Settings(QObject *parent) : QObject(parent)
{
    //qsrand(QTime::currentTime().msec());
}

bool Settings::isThemeInverted() const
{
    bool inverted = QSettings().value("themeInverted", false).toBool();
    qDebug() << "Settings::isThemeInverted():" << inverted;
    return inverted;
}

void Settings::setThemeInverted(bool inverted)
{
    if(inverted !=  QSettings().value("themeInverted", false).toBool())
    {
        qDebug() << "Settings::setThemeInverted():" << inverted;
        QSettings().setValue("themeInverted", inverted);
        emit themeInvertedChanged();
    }
}

