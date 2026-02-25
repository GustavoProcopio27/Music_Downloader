import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Effects

ApplicationWindow {
    visible: true
    width: 700
    height: 900
    title: "Music Downloader"
    color: "#2b2a2a"

    ColumnLayout { // ColumnLayout organiza os elementos em coluna (vertical)
        anchors.fill: parent
        spacing: 0



        StackLayout {
            id: view
            Layout.fillWidth: true
            Layout.fillHeight: true
            currentIndex: tabBar.currentIndex
            
            //  Paginas
            MusicPage { }
            PlaylistPage { }
        }

        // ===== TAB BAR =====
        TabBar { 
            id: tabBar
            currentIndex: view.currentIndex
            Layout.fillWidth: true
            background: Rectangle {color: "#2b2a2a"}
            spacing: 0

            TabButton { 
                text: "Music" 
                icon.source: "images/music_download_button_ico.svg"
                icon.width: 25
                icon.height: 25
                display: AbstractButton.TextBesideIcon
                background: Rectangle{ 
                                        color: parent.checked ? '#3b3b3b' : '#1f1e1e'
                                        topLeftRadius: 15
                                        topRightRadius: 0
                                        bottomLeftRadius: 0
                                        bottomRightRadius: 0
                                        border.color: "#93009c"
                                    }   
                }
            TabButton { 
                text: "Music Playlist" 
                icon.source: "images/playlist_download_button_ico.svg"
                icon.width: 25
                icon.height: 25
                display: AbstractButton.TextBesideIcon
                background: Rectangle{ 
                                        color: parent.checked ? '#3b3b3b' : '#1f1e1e'
                                        topLeftRadius: 0
                                        topRightRadius: 15
                                        bottomLeftRadius: 0
                                        bottomRightRadius: 0
                                        border.color: "#93009c"
                                    }                
                }

             
        }

    }
}