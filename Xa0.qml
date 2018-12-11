import QtQuick 2.0
import QtQuick.Controls 2.0
import Qt.labs.settings 1.0

Item {
    id:r
    anchors.fill: parent
    visible: r.a===0
    opacity: visible?1.0:0.0
    property alias nomApp: tiNomApp.text
    onVisibleChanged:{
        if(visible){
            tiNomApp.focus=true
            app.mp.source='./s1.m4a'
            app.mp.play()
        }
    }
    Behavior on opacity{NumberAnimation{duration:1500}}
    Settings{
        id:rs
        category:'conf-'+app.moduleName+'-area0'
        property string nomApp
    }
    Column{
        spacing: app.fs*0.5
        anchors.centerIn: parent
        Text{
            text:'Nombre de la Aplicaciòn a crear'
            font.pixelSize: app.fs
            color:app.c2
        }
        Rectangle{
            width: app.fs*20
            height: app.fs*1.4
            border.width: 2
            border.color: children[0].v?app.c2:'red'
            radius: app.fs*0.25
            color:'transparent'
            TextInput{
                id:tiNomApp
                font.pixelSize: app.fs
                width: parent.width-app.fs
                height: app.fs
                anchors.centerIn: parent
                color:app.c2
                text: rs.nomApp
                property bool v:false
                maximumLength: 25
                validator : RegExpValidator { regExp : /[^@\^\+\*#~¿?¡!.\/]+/ }
                Keys.onReturnPressed: botSiguiente.focus=true
                KeyNavigation.tab: botSiguiente
                onTextChanged: {
                    v=!unik.fileExist(appsDir+'/'+text)
                }
            }
        }
        Button{
            id:botSiguiente
            text:'<b>Siguiente</b>'
            font.pixelSize: app.fs
            onClicked: r.parent.a<r.parent.cantA?r.parent.a++:0
            Keys.onReturnPressed: r.parent.a<r.parent.cantA?r.parent.a++:0
            anchors.right: parent.right
        }
    }
    Component.onCompleted: {
        if(rs.nomApp===''){
            rs.nomApp='bd1'
        }
        tiNomApp.v=!unik.fileExist(appsDir+'/'+rs.nomApp)
    }
}

