import QtQuick 2.0
import QtMultimedia 5.8

MediaPlayer {
    id: mediaPlayerId
    property bool shuffer: false
    property bool repeater: false
    loops: repeater ? MediaPlayer.Infinite : 1
    onPlaybackStateChanged: {
        if (playbackState == MediaPlayer.StoppedState &&
        position == duration) {
            if (mediaPlayerId.shuffer) {
                var newIndex = Math.floor(Math.random() * playlistId.count)
                while (newIndex == playlistId.currentIndex) {
                    newIndex = Math.floor(Math.random() * playlistId.count)
                }
                playlistId.currentIndex = newIndex;
            } else if (playlistId.currentIndex < playlistId.count - 1) {
                playlistId.currentIndex = playlistId.currentIndex + 1;
            }
        }
    }
    autoPlay: true
}
