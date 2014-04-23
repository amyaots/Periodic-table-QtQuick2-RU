import QtQuick 2.0

Rectangle {
    id: root
    property int number: 0
    property alias colrect: root.color
    width: txt.width + 5
    height: txt.height + 2
    color: "white"
    Text{
        id: txt
        font.pointSize: 10
        text: number
        color: "black"
        anchors.horizontalCenter: root.horizontalCenter
        anchors.verticalCenter: root.verticalCenter
    }

}
