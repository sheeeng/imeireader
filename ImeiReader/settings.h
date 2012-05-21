#ifndef SETTINGS_H
#define SETTINGS_H

#include <QObject>

class Settings : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool themeInverted READ isThemeInverted WRITE setThemeInverted NOTIFY themeInvertedChanged)

public:
    explicit Settings(QObject *parent = 0);

    bool isThemeInverted() const;
    Q_INVOKABLE void setThemeInverted(bool inverted);

signals:
    void themeInvertedChanged();

private:
    bool themeInverted;
};

#endif // SETTINGS_H
