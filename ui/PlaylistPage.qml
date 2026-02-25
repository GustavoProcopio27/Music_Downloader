import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item
{

    Connections {
        target: backend

        function onDownloadFinished() {
            sucessToast.text = "Música baixada!"
            sucessToast.show()
        }

        function onDownloadError(message) {
            sucessToast.text = "Erro: " + message
            sucessToast.show()
        }
    }

    Rectangle 
    { 
        anchors.fill: parent
        color: "#2b2a2a"; 

        Toast{
            id: sucessToast
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.margins: 20
            text: "Músicas Baixadas!"

        }
        ColumnLayout {
            anchors.fill: parent
            spacing: 20
            anchors.margins: 30

            //HEADER
            RowLayout {
                Layout.fillWidth: true
                height: 60
                spacing: 12

                Image {
                    source: "images/music_playlist_ico.svg"
                    Layout.preferredWidth: 108
                    Layout.preferredHeight: 108
                    Layout.alignment: Qt.AlignHCenter
                    Layout.topMargin: 25
                    Layout.leftMargin: 55
                }

                Label {
                    text: "Download Playlists as MP3"
                    font.pixelSize: 36
                    color: "white"
                    Layout.alignment: Qt.AlignVCenter
                    Layout.topMargin: 25
                    Layout.leftMargin: 10
                }    

            }


            TextField  {
                id: playlistUrlInput
                Layout.fillWidth: true
                placeholderText: "Cole a URL de uma playlist do youtube ou spotify"
                placeholderTextColor: "#888888"
                font.pixelSize: 20
                background: Rectangle {
                    radius:12
                    color: "#1f1e1e"
                    border.width: 2
                    border.color: playlistUrlInput.activeFocus ? "#c218d4" : "#444444"
                    Behavior on border.color {ColorAnimation { duration: 150 }}
                }
            }
            Rectangle {
                id: buscarMusicBtn
                Layout.fillWidth: true
                height: 50
                anchors.margins: 20

                property bool hovered: false
                property bool pressed: false

                border.width: 2
                border.color: "#93009c"
                radius:15

                color: pressed ? "#5e0063" : hovered ? "#3b003f" : "#1f1e1e"
                Behavior on color { ColorAnimation { duration: 120 } }
                Text {
                    anchors.centerIn: parent
                    text: "Buscar músicas"
                    color: "#f8f8ff"
                    font.pixelSize: 20
                }       
                MouseArea{
                    cursorShape: Qt.PointingHandCursor

                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: buscarMusicBtn.hovered = true
                    onExited: buscarMusicBtn.hovered = false

                    onPressed: buscarMusicBtn.pressed = true
                    onReleased: buscarMusicBtn.pressed = false

                    onClicked:{
                        if (playlistUrlInput.text.length >0)
                        {
                        backend.buscarPlaylist(playlistUrlInput.text)
                        }
                    }
                }    
            }


            ListView {
                id: videoList
                Layout.fillWidth: true
                Layout.fillHeight: true
                model: videoModel
                delegate: Rectangle  {
                    width:ListView.view.width
                    height: 80
                    color: "#2c3e50"
                    radius: 8

                    Row { 
                        spacing:10
                        Image {   
                            source: thumbnail
                            width: 60
                            height: 60
                            fillMode: Image.PreserveAspectFit
                        }
                        Column {
                                Text {
                                    text: title
                                    color: "white"
                                    elide: Text.ElideRight
                                    width: 500
                                    font.pixelSize: 24
                                }
                                Text {
                                    text: size + " MB"
                                    color: "#bdc3c7"
                                    font.pixelSize: 24
                                }                                                    
                        }
                }
            }}  
            Rectangle {
                id: baixarMusicBtn
                Layout.fillWidth: true
                height: 50
                property bool hovered: false
                property bool pressed: false

                border.width: 2
                border.color: "#93009c"
                radius:15

                color: pressed ? "#5e0063" : hovered ? "#3b003f" : "#1f1e1e"
                Behavior on color { ColorAnimation { duration: 120 } }
                Text {
                    anchors.centerIn: parent
                    text: "Baixar músicas"
                    color: "#f8f8ff"
                    font.pixelSize: 20
                }       
                MouseArea{
                    cursorShape: Qt.PointingHandCursor

                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: baixarMusicBtn.hovered = true
                    onExited: baixarMusicBtn.hovered = false

                    onPressed: baixarMusicBtn.pressed = true
                    onReleased: baixarMusicBtn.pressed = false

                    onClicked:{backend.baixarVideos()}

                }    
            }
        }
    }
}