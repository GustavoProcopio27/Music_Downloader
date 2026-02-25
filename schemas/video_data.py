from typing import TYPE_CHECKING, TypedDict

if TYPE_CHECKING:
    from pytubefix import Stream


class VideoData(TypedDict):
    audio: "Stream"
    title: str
    thumbnail_url: str
    size_mb: float
