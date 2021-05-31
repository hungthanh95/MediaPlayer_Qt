#ifndef PLAYER_H
#define PLAYER_H

#include <QObject>
#include <QMediaPlayer>
#include <QMediaPlaylist>
#include <taglib/tag.h>
#include <taglib/fileref.h>
#include <taglib/id3v2tag.h>
#include <taglib/mpegfile.h>
#include <taglib/id3v2frame.h>
#include <taglib/id3v2header.h>
#include <taglib/attachedpictureframe.h>


QT_BEGIN_NAMESPACE
class QAbstractItemView;
class QMediaPlayer;
QT_END_NAMESPACE

class PlaylistModel;

using namespace TagLib;

class Player : public QObject
{
    Q_OBJECT
public:
    // Constructor
    explicit Player(QObject *parent = nullptr);

    // add media to playlist
    void addToPlaylist(const QList<QUrl> &urls);

    // open folder Music in your Os
    void open();



public slots:
    void shuffle();
    void prevMedia();
    void nextMedia();
    void repeater();
    void play();
    // parser time follow format hh:mm:ss
    QString getTimeInfo(qint64 currentInfo);

public:
    QString getAlbumArt(FileRef f, QUrl url);



    QMediaPlayer *m_player = nullptr;
    QMediaPlaylist *m_playlist = nullptr;
    PlaylistModel *m_playlistModel = nullptr;

    bool m_shuffle;
    bool m_repeat;
};

#endif // PLAYER_H
