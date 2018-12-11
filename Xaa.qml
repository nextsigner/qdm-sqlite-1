import QtQuick 2.0
import QtQuick.Controls 2.0

Item {
    id:r
    anchors.fill: parent
    visible: r.a===0
    opacity: visible?1.0:0.0
    onVisibleChanged:{
        if(visible){
            botCom.focus=true           
            app.mp.source=''
        }
    }
    Behavior on opacity{NumberAnimation{duration:1500}}
    Column{
        spacing: app.fs
        anchors.centerIn: r
        Text{
            text:'<b>Construye y aprende</b><br><b>Aplicaciòn Sqlite</b>'
            font.pixelSize: app.fs*2
            color: app.c2
            horizontalAlignment: Text.AlignHCenter
        }
        Button{
            id:botCom
            text:'<b>Comenzar</b>'
            font.pixelSize: app.fs
            onClicked: r.parent.a<r.parent.cantA?r.parent.a++:0
            Keys.onReturnPressed: r.parent.a=1
            anchors.right: parent.right
        }
    }
    Component.onCompleted: {
        controles.rb.visible=false
    }
}

