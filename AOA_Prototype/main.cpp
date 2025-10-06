#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>
#include "backend.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQuickStyle::setStyle("Basic");

    qmlRegisterType<BackEnd>("AppBackend", 1, 0, "Backend");


    QQmlApplicationEngine engine;
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("AOA_Prototype", "Main");

    return app.exec();
}
