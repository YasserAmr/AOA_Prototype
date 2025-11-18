#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>
#include <QQmlContext>
#include "backend.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQuickStyle::setStyle("Basic");

    BackEnd backend;

    // qmlRegisterType<BackEnd>("AppBackend", 1, 0, "Backend");

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("backend", &backend);
    engine.addImportPath("qrc:/qt/qml/AOA_Prototype/");

    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    // engine.loadFromModule("AOA_Prototype", "Main");
    engine.load(QUrl(QStringLiteral("qrc:/qt/qml/AOA_Prototype/Main.qml")));


    return app.exec();
}
