import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Dialogs 1.0
import Qt.labs.settings 1.0
import QtQuick.Window 2.0

Item {
    id:r
    anchors.fill: parent
    onVisibleChanged: {
        if(visible){
            tiAnVent.focus=true
        }
    }
    Settings{
        id:rs
        property bool maximizado
        property bool fullScreen
        property int an
        property int al
        property string color
    }
    Column{
        spacing: app.fs
        anchors.centerIn: parent
        Text{
            text:'<b>Crear Ventana Principal</b>'
            font.pixelSize: app.fs
            color:app.c2
        }
        Row{
            Text{
                text:'Maximizado: '
                font.pixelSize: app.fs
                color:app.c2
            }
            CheckBox {
                id:cb1
                checked: rs.maximizado
                font.pixelSize:app.fs
                KeyNavigation.tab: cb2
                onCheckedChanged: rs.maximizado=checked
            }
            Item{width: app.fs*3;height: 10}
            Text{
                text:'Ver Pantalla Completa: '
                font.pixelSize: app.fs
                color:app.c2
            }
            CheckBox {
                id:cb2
                checked: rs.fullScreen
                font.pixelSize:app.fs
                KeyNavigation.tab: tiAnVent
                onCheckedChanged: rs.fullScreen=checked
            }
        }
        Row{
            Text{
                text:'Tamaño de Ventana'
                font.pixelSize: app.fs
                color:app.c2
            }
            Text{
                text:'       Ancho: '
                font.pixelSize: app.fs
                color:app.c2
            }
            Rectangle{
                width: app.fs*4
                height: app.fs*1.4
                border.width: 2
                border.color: children[0].v?app.c2:'red'
                radius: app.fs*0.25
                color:'transparent'
                TextInput{
                    id:tiAnVent
                    font.pixelSize: app.fs
                    width: parent.width-app.fs
                    height: app.fs
                    anchors.centerIn: parent
                    color:app.c2
                    text:''+rs.an
                    property bool v:false
                    maximumLength: 4
                    validator : RegExpValidator { regExp : /[0-9]+/ }
                    Keys.onReturnPressed: tiAlVent.focus=true
                    KeyNavigation.tab: tiAlVent
                    onTextChanged: {
                        v=parseInt(text)<=Screen.width
                        if(v){
                            rs.an=text
                        }
                    }
                }
            }
            Text{
                text:'      Alto: '
                font.pixelSize: app.fs
                color:app.c2
            }
            Rectangle{
                width: app.fs*4
                height: app.fs*1.4
                border.width: 2
                border.color: children[0].v?app.c2:'red'
                radius: app.fs*0.25
                color: 'transparent'
                TextInput{
                    id:tiAlVent
                    font.pixelSize: app.fs
                    width: parent.width-app.fs
                    height: app.fs
                    anchors.centerIn: parent
                    color:app.c2
                    text:''+rs.al
                    property bool v:false
                    maximumLength: 4
                    validator : RegExpValidator { regExp : /[0-9]+/ }
                    Keys.onReturnPressed: botSiguiente.focus=true
                    KeyNavigation.tab: tiAnVent.v&&tiAlVent.v?botSiguiente:tiAlVent
                    onTextChanged: {
                        v=parseInt(text)<=Screen.height
                        if(v){
                            rs.al=text
                        }
                    }
                }
            }
        }
        Row{
            spacing: app.fs*0.5
            height: app.fs*1.4
            Text{
                text:'Color de la Ventana: '+rs.color
                font.pixelSize: app.fs
                color:app.c2
                anchors.verticalCenter: parent.verticalCenter
            }
            Rectangle{
                width: app.fs*3
                height: app.fs
                color: rs.color
                anchors.verticalCenter: parent.verticalCenter
                border.width: 2
                border.color: app.c2
            }
            Button{
                id:botColor
                text:'<b>Seleccionar Color</b>'
                font.pixelSize: app.fs
                onClicked: colorDialog.visible=true
                Keys.onReturnPressed: colorDialog.visible=true
                KeyNavigation.tab: botSiguiente
                anchors.verticalCenter: parent.verticalCenter
            }
        }
        Button{
            id:botSiguiente
            text:'<b>Siguiente</b>'
            font.pixelSize: app.fs
            onClicked: r.parent.a++
            Keys.onReturnPressed: r.parent.a++
            anchors.right: parent.right
            enabled: tiAnVent.v&&tiAlVent.v
            KeyNavigation.tab: cb1
        }
    }
    ColorDialog {
        id: colorDialog
        title: "Seleccionar el color de la Ventana"
        onAccepted: {
            rs.color=colorDialog.color
        }
    }
    Component.onCompleted: {
        if(rs.an<=0){
            rs.an=500
        }
        if(rs.al<=0){
            rs.al=500
        }
    }
}

