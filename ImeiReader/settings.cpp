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

