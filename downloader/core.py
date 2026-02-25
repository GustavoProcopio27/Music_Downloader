from pathlib import Path

from PySide6.QtCore import QStandardPaths
from pytubefix import Playlist, Stream, YouTube

from schemas.video_data import VideoData


def get_playlist_videos(url: str) -> list[VideoData]:
    videos_data: list[VideoData] = list()



    playlist = Playlist(url)

    for video in playlist.videos:
        audio_stream = video.streams.get_audio_only()
        videos_data.append(
            {
                "audio": audio_stream,
                "title": video.title,
                "thumb": video.thumbnail_url,
                "size": audio_stream.filesize_mb,
            }
        )

    return videos_data


def get_video(url: str) -> VideoData:


    video = YouTube(url)

    video_data: VideoData = {
        "audio": video.streams.get_audio_only(),
        "title": video.title,
        "thumb": video.thumbnail_url,
        "size": video.streams.get_audio_only().filesize_mb,
    }

    return video_data


def download_music(audio: Stream) -> None:
    output_path: Path = Path(QStandardPaths.writableLocation(QStandardPaths.StandardLocation.DownloadLocation))
    if not output_path.exists():
        output_path.mkdir(parents=True, exist_ok=True)

    audio.download(str(output_path))
