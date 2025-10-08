// #include <QtQuickTest/quicktest.h>
// #include <QQmlEngine>

// int main(int argc, char **argv)
// {
//     qputenv("QML2_IMPORT_PATH", QByteArray("E:/Education/AOA_Prototype/AOA_Prototype/components"));
//     return quick_test_main(argc, argv, "MyQmlTests", nullptr);
// }

#include <QQmlApplicationEngine>
#include <QtQuickTest/quicktest.h>
#include <QQmlEngine>
#include <QCoreApplication>
#include <QDir>
#include <QDebug>

class TestSetup : public QObject
{
    Q_OBJECT
public slots:
    void setup() {
        QString buildDir = QCoreApplication::applicationDirPath();
        QString sourceRoot = QDir(buildDir + "/../../").absolutePath();

        QString componentsPath = sourceRoot + "/AOA_Prototype/components";
        QString testsPath = sourceRoot + "/AOA_Prototype/qmlTests";

        qputenv("QML2_IMPORT_PATH", (componentsPath + ";" + testsPath).toUtf8());
        qputenv("QML_IMPORT_PATH", (componentsPath + ";" + testsPath).toUtf8());
    }

    void cleanup() {}
};

QUICK_TEST_MAIN_WITH_SETUP(MyQmlTests, TestSetup)
#include "qml_tst_runner.moc"

