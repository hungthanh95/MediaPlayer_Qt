#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "player.h"
#include <QQmlContext>
#include "playlistmodel.h"

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

//    qRegisterMetaType<QMediaPlaylist*>("QMediaPlaylist*");
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    Player player;
//    engine.rootContext()->setContextProperty("Hu",player.m_playlistModel);
//    engine.rootContext()->setContextProperty("He",player.m_player);
//    engine.rootContext()->setContextProperty("Ho",&player);
//    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
//    if (engine.rootObjects().isEmpty())
//        return -1;

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
