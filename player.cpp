#include "player.h"
#include "playlistmodel.h"

#include <QMediaService>
#include <QMediaPlaylist>
#include <QMediaMetaData>
#include <QObject>
#include <QFileInfo>
#include <QTime>
#include <QDir>
#include <QStandardPaths>
#include <math.h>

Player::Player(QObject *parent) : QObject(parent)
{
    m_shuffle = false;
    m_repeat = false;
    m_player = new QMediaPlayer(this);
    m_playlist = new QMediaPlaylist(this);
    m_player->setPlaylist(m_playlist);
    m_playlistModel = new PlaylistModel(this);
    m_player->setVolume(25);
    open();
    if (!m_playlist->isEmpty()) {
        m_playlist->setCurrentIndex(0);
    }
//    connect(this->m_player, &QMediaPlayer::mediaStatusChanged, this, &Player::handleEndMedia);
}
void Player::open() {
    QDir directory(QStandardPaths::standardLocations(QStandardPaths::MusicLocation)[0]);
    QFileInfoList musics = directory.entryInfoList(QStringList() << "*.mp3", QDir::Files);
    QList<QUrl> urls;
    for(int i = 0; i < musics.length(); i++) {
        urls.append(QUrl::fromLocalFile(musics[i].absoluteFilePath()));
    }
    addToPlaylist(urls);
}

void Player::addToPlaylist(const QList<QUrl> &urls) {
    for (auto &url : urls) {
        m_playlist->addMedia(url);
        FileRef f(url.toLocalFile().toStdString().c_str());
        Tag *tag = f.tag();
        QString title = QString::fromWCharArray(tag->title().toCWString());
        QString artist = QString::fromWCharArray(tag->artist().toCWString());
        Song song(title,
                  artist,
                  url.toDisplayString(),
                  getAlbumArt(f, url));
        m_playlistModel->addSong(song);
    }
}

QString Player::getTimeInfo(qint64 currentInfo)
{
    QString tStr = "00:00";
    currentInfo = currentInfo/1000;
    qint64 durarion = m_player->duration()/1000;
    if (currentInfo || durarion) {
        QTime currentTime((currentInfo / 3600) % 60, (currentInfo / 60) % 60,
                          currentInfo % 60, (currentInfo * 1000) % 1000);
        QTime totalTime((durarion / 3600) % 60, (m_player->duration() / 60) % 60,
                        durarion % 60, (m_player->duration() * 1000) % 1000);
        QString format = "mm:ss";
        if (durarion > 3600)
            format = "hh::mm:ss";
        tStr = currentTime.toString(format);
    }
    return tStr;
}

QString Player::getAlbumArt(FileRef ref, QUrl url)
{
    static const char *IdPicture = "APIC" ;
    if (!ref.isNull()) {
//        TagLib::MPEG::File mpegFile(url.toLocalFile().toStdString().c_str());
        auto mpeg = dynamic_cast<TagLib::MPEG::File*>(ref.file());
        TagLib::ID3v2::Tag *id3v2tag = mpeg->ID3v2Tag();
        TagLib::ID3v2::FrameList Frame ;
        TagLib::ID3v2::AttachedPictureFrame *PicFrame ;
        void *SrcImage ;
        unsigned long Size ;

        FILE *jpegFile;
        jpegFile = fopen(QString(url.fileName()+".jpg").toStdString().c_str(),"wb");

        if ( id3v2tag )
        {
            // picture frame
            Frame = id3v2tag->frameListMap()[IdPicture] ;
            if (!Frame.isEmpty() )
            {
                for(TagLib::ID3v2::FrameList::ConstIterator it = Frame.begin(); it != Frame.end(); ++it)
                {
                    PicFrame = static_cast<TagLib::ID3v2::AttachedPictureFrame*>(*it) ;
    //                  if ( PicFrame->type() ==
    //                TagLib::ID3v2::AttachedPictureFrame::FrontCover)
                    {
                        // extract image (in it’s compressed form)
                        Size = PicFrame->picture().size() ;
                        SrcImage = malloc ( Size ) ;
                        if ( SrcImage )
                        {
                            memcpy ( SrcImage, PicFrame->picture().data(), Size ) ;
                            fwrite(SrcImage,Size,1, jpegFile);
                            fclose(jpegFile);
                            free( SrcImage ) ;
                            return QUrl::fromLocalFile(url.fileName()+".jpg").toDisplayString();
                        }

                    }
                }
            }
        }
        else
        {
            qDebug() <<"id3v2 not present";
            return "qrc:/Image/album_art.png";
        }
    }

    return "qrc:/Image/album_art.png";
}

void Player::shuffle()
{
    m_shuffle = !m_shuffle;
    if (m_shuffle) {
        m_playlist->setPlaybackMode(QMediaPlaylist::PlaybackMode::Random);
    } else if (m_playlist->playbackMode() != QMediaPlaylist::PlaybackMode::Sequential) {
        m_playlist->setPlaybackMode(QMediaPlaylist::PlaybackMode::Sequential);
    } else {
        // Do nothing
    }
}

void Player::prevMedia()
{
    m_playlist->previous();
}

void Player::nextMedia()
{
    m_playlist->next();
}

void Player::repeater()
{
    m_repeat = !m_repeat;

    if (m_repeat) {
        m_playlist->setPlaybackMode(QMediaPlaylist::PlaybackMode::CurrentItemInLoop);
    } else if (m_playlist->playbackMode() != QMediaPlaylist::PlaybackMode::Sequential) {
        m_playlist->setPlaybackMode(QMediaPlaylist::PlaybackMode::Sequential);
    } else {
        // Do nothing
    }
}

void Player::play()
{
    if (m_player->state() == QMediaPlayer::State::PlayingState) {
        m_player->pause();
    } else {
        m_player->play();
    }
}

//void Player::handleEndMedia()
//{
//    if (m_player->state() == QMediaPlayer::StoppedState &&
//        m_player->position() == m_player->duration()) {
//        if (m_shuffle) {
//            int newIndex = floor(rand() % m_playlist->mediaCount());
//            while (newIndex == m_playlist->currentIndex()) {
//                newIndex =  floor(rand() % m_playlist->mediaCount());
//            }
//            m_playlist->setCurrentIndex(newIndex);
//        } else if (m_playlist->currentIndex() < m_playlist->mediaCount() - 1) {
//            m_playlist->setCurrentIndex(m_playlist->currentIndex() + 1);
//        }
//    }
//}
