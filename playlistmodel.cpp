#include "playlistmodel.h"

#include <QFileInfo>
#include <QUrl>
#include <QMediaPlaylist>

PlaylistModel::PlaylistModel(QObject *parent)
    : QAbstractListModel(parent)
{
}

int PlaylistModel::rowCount(const QModelIndex &parent) const
{
//   Q_UNUSED(parent);
    if (parent.isValid() || m_data.isEmpty())
        return 0;
    return m_data.size();
}


QVariant PlaylistModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid() || m_data.isEmpty())
        return QVariant();
    switch (role) {
    case TitleRole:
        return m_data[index.row()].title();
    case SingerRole:
        return m_data[index.row()].singer();
    case SourceRole:
        return m_data[index.row()].source();
    case AlbumArtRole:
        return m_data[index.row()].album_art();
    }
    return QVariant();
}

void PlaylistModel::addSong(Song &song)
{
    m_data.append(song);
}

QHash<int, QByteArray> PlaylistModel::roleNames() const
{
    QHash<int, QByteArray> names;
    names[TitleRole] = "title";
    names[SingerRole] = "singer";
    names[SourceRole] = "source";
    names[AlbumArtRole] = "albumArt";
    return names;
}

Song::Song(const QString &title, const QString &singer, const QString &source, const QString &albumArt)
{
    m_title = title;
    m_singer = singer;
    m_source = source;
    m_albumArt = albumArt;
}

QString Song::title() const
{
    return m_title;
}

QString Song::singer() const
{
    return m_singer;
}

QString Song::source() const
{
    return m_source;
}

QString Song::album_art() const
{
    return m_albumArt;
}
