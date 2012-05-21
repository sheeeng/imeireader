#include <QtGui/QApplication>
#include "qmlapplicationviewer.h"
#include <QtDeclarative>
#include <QSystemDeviceInfo>
using namespace QtMobility;
#include <QDebug>
#include "settings.h"

Q_DECL_EXPORT int main(int argc, char *argv[])
{
    QScopedPointer<QApplication> app(createApplication(argc, argv));

    QmlApplicationViewer viewer;

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
