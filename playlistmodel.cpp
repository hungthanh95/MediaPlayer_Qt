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
    if (parent.isValid())
        return 0;
    return m_data.size();
}


QVariant PlaylistModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid())
        return QVariant();
    if (role == Qt::DecorationRole)
        return QVariant();
    return QVariant();
}

void PlaylistModel::addSong(Song &song)
{
    m_data.append(song);
}

//QHash<int, QByteArray> PlaylistModel::roleNames() const
//{
//    return QHash<int, QByteArray>();
//}

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
