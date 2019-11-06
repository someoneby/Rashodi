//#include <QGuiApplication>
//#include <QQmlApplicationEngine>

//int main(int argc, char *argv[])
//{
//    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

//    QGuiApplication app(argc, argv);

//    QQmlApplicationEngine engine;
//    const QUrl url(QStringLiteral("qrc:/main.qml"));
//    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
//                     &app, [url](QObject *obj, const QUrl &objUrl) {
//        if (!obj && url == objUrl)
//            QCoreApplication::exit(-1);
//    }, Qt::QueuedConnection);
//    engine.load(url);

//    return app.exec();
//}


#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlComponent>
#include "src/dataadder.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;

    QQmlComponent comp(&engine, QUrl("qrc:/main.qml"));
    DataAdder dataAdder;
    QObject* pobj = comp.create();

    QObject* dataAdderObj = pobj->findChild<QObject*>("DataAdderButt");
    if(dataAdderObj){
        QObject::connect(
            dataAdderObj, SIGNAL(addComplete(QString)),
                    &dataAdder, SLOT(slotInfo(QString))
        );
    }

    return app.exec();
}
















