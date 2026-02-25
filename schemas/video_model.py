from PySide6.QtCore import QAbstractListModel, QModelIndex, Qt

from schemas.video_data import VideoData


class VideoModel(QAbstractListModel):
    TitleRole = Qt.ItemDataRole.UserRole + 1
    ThumbnailRole = Qt.ItemDataRole.UserRole + 2
    SizeRole = Qt.ItemDataRole.UserRole + 3

    def __init__(self) -> None:
        super().__init__()
        self._videos: list[VideoData] = []

    def rowCount(self, parent: QModelIndex) -> int:
        parent = QModelIndex()
        if parent.isValid():
            return 0
        return len(self._videos)

    def data(self, index: QModelIndex, role: int) -> str | None:
        if not index.isValid():
            return None
        video = self._videos[index.row()]

        if role == self.TitleRole:
            return video["title"]
        if role == self.ThumbnailRole:
            return video["thumb"]
        if role == self.SizeRole:
            return str(video["size"])

        return None

    def roleNames(self) -> dict[int, bytes]:
        return {
            self.TitleRole: b"title",
            self.ThumbnailRole: b"thumbnail",
            self.SizeRole: b"size",
        }

    def setVideos(self, videos: list[VideoData]) -> None:
        self.beginResetModel()
        self._videos = videos
        self.endResetModel()

    @property
    def getVideos(self) -> list[VideoData]:
        return self._videos
