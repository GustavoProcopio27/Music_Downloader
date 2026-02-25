from PySide6.QtCore import QObject, Signal, Slot

from downloader.core import download_music, get_playlist_videos, get_video
from schemas.video_data import VideoData
from schemas.video_model import VideoModel


class Backend(QObject):
    downloadFinished = Signal()
    downloadError = Signal(str)

    def __init__(self) -> None:
        super().__init__()
        self.videoModel = VideoModel()
        self._current_audio = None

    @Slot(str)
    def buscarPlaylist(self, url):
        videos_data: list[VideoData] = get_playlist_videos(url)
        if len(videos_data) == 0:
            return
        self.videoModel.setVideos(videos_data)

    @Slot(str)
    def buscarVideo(self, url):
        video_data: VideoData = get_video(url)
        if not video_data:
            return
        self.videoModel.setVideos([video_data])

    @Slot()
    def baixarVideos(self) -> None:
        try:
            for video in self.videoModel.getVideos:
                if not video:
                    continue
                download_music(video["audio"])
            self.clearVideos()
            self.downloadFinished.emit()

        except Exception:
            self.clearVideos()
            self.downloadError.emit("Falha ao baixar música")

    def clearVideos(self):
        self.videoModel.setVideos([])
