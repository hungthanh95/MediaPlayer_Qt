#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "player.h"
#include <QQmlContext>
#include "playlistmodel.h"
#include <translation.h>


int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    qRegisterMetaType<QMediaPlaylist*>("QMediaPlaylist*");

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    Translation translator(&app);

    Player player;
    engine.rootContext()->setContextProperty("playplistModel", player.m_playlistModel);
    engine.rootContext()->setContextProperty("player" ,player.m_player);
    engine.rootContext()->setContextProperty("myPlayer", &player);
    engine.rootContext()->setContextProperty("translator",&translator);

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
