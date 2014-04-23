import QtQuick 2.0

Rectangle {
    id: root
    property alias symbol: symbolEl.text
    property alias atomnumber: anum.number
    property alias group: root.state
    property string category: "value"
    property real atommass: 0
    property bool xray: false
    property alias name: nameEl.text
    property real electr: 2.10
    property real radiusr: 0.05
    property bool metal: false
    states: State {
        name: "B"
        PropertyChanges {target: symbolEl; horizontalAlignment: Text.AlignRight}
        PropertyChanges {target: atomMass; horizontalAlignment: Text.AlignRight}
        PropertyChanges {target: nameEl; horizontalAlignment: Text.AlignRight}
        PropertyChanges {target: elect; horizontalAlignment: Text.AlignLeft}
        PropertyChanges {target: radius; horizontalAlignment: Text.AlignLeft}
    }
    color: if (category=="s") "#67c111"
           else if (category=="p") "#00bde3"
           else if (category=="d") "#FFFA52"
           else "#A6A5A5"
    width: 90
    height: 50
    border.color: Qt.lighter(color)
    Text{
        id: symbolEl
        font.pointSize: 16
        color: "black"
        text: "H"
        anchors{
            left: root.left
            top: root.top
            leftMargin: 5
            right: root.right
            rightMargin: 5
        }
    }
    Text{
        id: atomMass
        font.pointSize: 7
        font.bold: true
        color: "black"
        text: if(xray) "["+atommass+"]"
              else atommass
        anchors.top: symbolEl.bottom
        anchors.topMargin: -1
        anchors.left: symbolEl.left
        anchors.right: symbolEl.right
    }
    Text{
        id: nameEl
        font.pointSize: 10
        color: "black"
        //text: qsTr("Водород")
        anchors.bottom: root.bottom
        anchors.bottomMargin: 2
        anchors.left: symbolEl.left
        anchors.right: symbolEl.right
    }
    AtomNum{
        id: anum
        colrect: metal? root.color : "white"
        number: 1
        anchors.top: root.top
        anchors.topMargin: 2
        anchors.horizontalCenter: root.horizontalCenter
    }
    Text{
        id: elect
        font.pointSize: 7
        font.underline: true
        color: "black"
        text: electr
        horizontalAlignment: Text.AlignRight
        anchors{
            top: root.top
            topMargin: 10
            right: root.right
            rightMargin: 10
            left: root.left
            leftMargin: 10
        }
    }
    Text {
        id: radius
        text: radiusr
        font.pointSize: 7
        color: "black"
        horizontalAlignment: Text.AlignRight
        anchors.top: elect.bottom
        anchors.topMargin: 2
        anchors.left: elect.left
        anchors.right: elect.right
    }
}
