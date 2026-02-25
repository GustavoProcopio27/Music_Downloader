import sys
from pathlib import Path

from PySide6.QtGui import QGuiApplication, QIcon
from PySide6.QtQml import QQmlApplicationEngine
from PySide6.QtQuickControls2 import QQuickStyle

from interface.communication import Backend


def main() -> None:
    app = QGuiApplication(sys.argv)
    QQuickStyle.setStyle("Fusion")
    base_path = Path(__file__).resolve().parent
    icon_path = base_path / "ui/images/app_icon.ico"

    app.setWindowIcon(QIcon(str(icon_path)))

    backend = Backend()

    engine = QQmlApplicationEngine()
    engine.rootContext().setContextProperty("backend", backend)
    engine.rootContext().setContextProperty("videoModel", backend.videoModel)
    engine.load("ui/main.qml")

    if not engine.rootObjects():
        sys.exit(-1)

    sys.exit(app.exec())


if __name__ == "__main__":
    main()
