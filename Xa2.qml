import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Dialogs 1.0
import Qt.labs.settings 1.0
import QtQuick.Window 2.0

Item {
    id:r
    anchors.fill: parent
    visible: r.a===3
    opacity: visible?1.0:0.0
    property alias nomBD: tiNomBD.text
    onVisibleChanged: {
        if(visible){
            tiNomBD.focus=true
            app.mp.source='./s3.m4a'
            app.mp.play()
        }
    }
    Settings{
        id:rs
        category:'conf-'+app.moduleName+'-area2'
        property string nomBD
    }
    Column{
        spacing: app.fs
        anchors.centerIn: parent
        Text{
            text:'<b>Crear Base de Datos</b>'
            font.pixelSize: app.fs
            color:app.c2
        }
        Row{
            spacing: app.fs*0.5
            Text{
                text:'Nombre de la Base de Datos: '
                font.pixelSize: app.fs
                color:app.c2
            }
            Rectangle{
                width: app.fs*10
                height: app.fs*1.4
                border.width: 2
                border.color: app.c2
                radius: app.fs*0.25
                color:'transparent'
                clip:true
                TextInput{
                    id:tiNomBD
                    font.pixelSize: app.fs
                    width: parent.width-app.fs
                    height: app.fs
                    anchors.centerIn: parent
                    color:app.c2
                    text:''+rs.nomBD
                    maximumLength: 150
                    Keys.onReturnPressed: botSiguiente.focus=true
                    KeyNavigation.tab: botSiguiente
                }
            }
         }
        Row{
            spacing: app.fs*0.5
            anchors.right: parent.right
            Button{
                id:botAtras
                text:'<b>Atras</b>'
                font.pixelSize: app.fs
                onClicked: r.parent.a--
                Keys.onReturnPressed: r.parent.a--
                KeyNavigation.tab: botSiguiente
            }
            Button{
                id:botSiguiente
                text:'<b>Siguiente</b>'
                font.pixelSize: app.fs
                onClicked: r.parent.a++
                Keys.onReturnPressed: r.parent.a++
                enabled: tiNomBD.text!==''
                KeyNavigation.tab: tiNomBD
            }
        }
    }
    Component.onCompleted: {
        if(rs.nomBD===''){
                rs.nomBD='datos1'
        }
    }
}

