import QtQuick
import QtQuick.Controls

Rectangle {
    id: toast
    width: 200; height: 50
    color: '#585252'
    radius: 10
    opacity: 0
    border.width: 2
    border.color: "#93009c"

    property alias text: toastText.text
    
    Text {
        id: toastText
        anchors.centerIn: parent
        color: '#6b0379'
    }

    Behavior on opacity { NumberAnimation { duration: 500 } }

    function show() {
        opacity = 1
        timer.start()
    }

    Timer {
        id: timer
        interval: 3000 // Display for 2 seconds
        onTriggered: toast.opacity = 0
    }
}