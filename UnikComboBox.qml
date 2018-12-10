import QtQuick 2.0
import QtQuick.Controls 2.0

ComboBox{
    width: app.fs*10
    height: app.fs*1.4
    model:["TEXTO", "NUMERO"]
    font.pixelSize: app.fs
    property int nci: currentIndex
    popup.onClosed:{
        currentIndex=nci
    }
    Keys.onEnterPressed: {
        event.accepted=false
    }
    Keys.onReturnPressed: {
        event.accepted=false
    }
    Keys.onDownPressed:  {
        if(!popup.visible){
            popup.open()
        }else{
            if(nci<model.length-1){
                nci++
            }
        }
    }
    Keys.onUpPressed:   {
        if(!popup.visible){
            popup.open()
        }else{
            if(nci>0){
                nci--
            }
        }
    }
    indicator:Item{
        width:app.fs*1.4;
        height:width;
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
        Text{
            text:'&#8227;'
            textFormat: Text.RichText
            font.pixelSize: app.fs
            color: app.c2
            rotation: 90
            anchors.centerIn: parent
            anchors.verticalCenterOffset: app.fs*0.2
        }
        Text{
            text:'&#8227;'
            textFormat: Text.RichText
            font.pixelSize: app.fs
            color: app.c2
            rotation: -90
            anchors.centerIn: parent
            anchors.verticalCenterOffset: 0-app.fs*0.2
            anchors.horizontalCenterOffset: app.fs*0.025
        }
    }
    contentItem: Text {
        text: ' '+parent.currentText
        color: app.c2
        font.pixelSize: app.fs
        elide: Text.ElideRight
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignLeft
    }
    background: Rectangle {
        id: bgCb
        color:app.c3
        border.color: !parent.focus?app.c2:'red'
        radius: app.fs*0.15
    }
    delegate: ItemDelegate {
        id:itemDlgt
        width: parent.width
        height:app.fs*1.4
        padding:0
        contentItem: Text {
            id:textItem
            text: ' '+modelData
            color: hovered||textItem.text===' '+bgCb.parent.model[bgCb.parent.nci]?app.c3:app.c2
            font.pixelSize: app.fs
            elide: Text.ElideRight
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignLeft
        }
        background: Rectangle {
            color:itemDlgt.hovered||textItem.text===' '+bgCb.parent.model[bgCb.parent.nci]?app.c2:app.c3;
            anchors.left: itemDlgt.left
            anchors.leftMargin: 0
            width:itemDlgt.parent.width-2
            Rectangle{width: parent.width;height: 2; color: app.c2}
        }

    }
}

