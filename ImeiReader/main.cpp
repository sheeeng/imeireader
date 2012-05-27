#include <QtGui/QApplication>
#include "qmlapplicationviewer.h"
#include <QtDeclarative>
#include <QSystemDeviceInfo>
using namespace QtMobility;
#include <QDebug>
#include "settings.h"

Q_DECL_EXPORT int main(int argc, char *argv[])
{
    QApplication::setApplicationName("ImeiReader");
    QApplication::setApplicationVersion(IMEIREADER_VERSION);
    QApplication::setOrganizationName("S2");

#ifdef QT_NO_DEBUG
    qDebug() << "Running release build.";
#else
    qDebug() << "Running debug build.";
#endif

    QScopedPointer<QApplication> app(createApplication(argc, argv));

    QmlApplicationViewer viewer;

#ifdef Q_OS_SYMBIAN
    QString appNameFull = QObject::tr("%1 %2 for %3").arg(QApplication::applicationName())
            .arg(QApplication::applicationVersion()).arg(QObject::tr("Symbian"));
#else //MEEGO_EDITION_HARMATTAN
    QString appNameFull = QObject::tr("%1 %2 for %3").arg(QApplication::applicationName())
            .arg(QApplication::applicationVersion()).arg(QObject::tr("MeeGo"));
#endif //MEEGO_EDITION_HARMATTAN

    QString appNameVersion = QObject::tr("%1 %2").arg(QApplication::applicationName()).arg(QApplication::applicationVersion());
    QString appName = QObject::tr("%1").arg(QApplication::applicationName());
    viewer.rootContext()->setContextProperty("ApplicationNameFullImeiReader", appNameFull);
    viewer.rootContext()->setContextProperty("ApplicationNameVersonImeiReader", appNameVersion);
    viewer.rootContext()->setContextProperty("ApplicationNameImeiReader", appName);

    qDebug() << appNameFull;
    qDebug() << appNameVersion;
    qDebug() << appName;

    Settings settings;
    viewer.rootContext()->setContextProperty("Settings", &settings); // must use before setMainQmlFile() function.
    //qmlRegisterType<Settings>("com.mycompany.qmlcomponents", 1, 0, "Settings"); // don't need in this project

    viewer.setOrientation(QmlApplicationViewer::ScreenOrientationAuto);
    viewer.setMainQmlFile(QLatin1String("qml/ImeiReader/main.qml"));
    viewer.showExpanded();

    QSystemDeviceInfo deviceInfo;
    qDebug() << "QSystemDeviceInfo's IMEI is" << deviceInfo.imei() << ".";
    qDebug() << "QSystemDeviceInfo's manufacturer is" << deviceInfo.manufacturer() << ".";
    qDebug() << "QSystemDeviceInfo's model is" << deviceInfo.model() << ".";
    qDebug() << "QSystemDeviceInfo's product name is" << deviceInfo.productName() << ".";
    qDebug() << "QSystemDeviceInfo's unique device ID is" << deviceInfo.uniqueDeviceID() << ".";

    return app->exec();
}
