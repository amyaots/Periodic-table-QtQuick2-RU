import QtQuick 2.0
import QtQuick.XmlListModel 2.0

Rectangle {
    width: 1024
    height: 612
    color: "#1f383b"

    MouseArea {
        anchors.fill: parent
        onClicked: {
            Qt.quit();
        }
    }
    XmlListModel {
        id: elementsModel
        source: "elements.xml"
        query: "/elements/atom"
        XmlRole { name: "names"; query: "name/string()" }
        XmlRole { name: "symbols"; query: "symbol/string()" }
        XmlRole { name: "atomicmass"; query: "atomicMass/number()" }
        XmlRole { name: "atomicnum"; query: "atomicNum/number()" }
        XmlRole { name: "radiusx"; query: "radius/number()" }
        XmlRole { name: "elecronegat"; query: "elecronegativity/number()" }
        XmlRole { name: "groupx"; query: "group/string()" }
        XmlRole { name: "categoryx"; query: "category/string()" }
        XmlRole { name: "metalx"; query: "metal/number()" }
        XmlRole { name: "xrayx"; query: "xray/number()" }
    }
    Text {
        id: testtext
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        text: elementsModel.count
        color: "white"
    }
    GridView {
        x: 20
        y:20
        width: 950; height: 600
        model: elementsModel
        cellWidth: 93
        cellHeight: 53
        //spacing: 2
        delegate:
            Cell{
                name: qsTr(names)
                symbol: symbols
                atomnumber: atomicnum
                group: groupx
                category: categoryx
                electr: elecronegat
                radiusr: radiusx
                atommass: atomicmass
                metal: metalx
                xray: xrayx
                visible: (names=="0")? false:true
                MouseArea {
                    anchors.fill: parent
                    onClicked: testtext.text=parent.symbol
                }
            }
    }
}

