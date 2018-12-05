import QtQuick 2.0
import QtQuick.Controls 2.0

Row{
    id:r
    height: app.fs*1.4
    spacing: app.fs*0.5
    property string nom
    property alias t: cb1.currentIndex

    Rectangle{
        width: app.fs*12
        height: app.fs*1.4
        border.width: 2
        border.color: children[0].v?app.c2:'red'
        radius: app.fs*0.25
        color:'transparent'
        TextInput{
            id:tiNomCol
            font.pixelSize: app.fs
            width: parent.width-app.fs
            height: app.fs
            anchors.centerIn: parent
            color:app.c2
            text:r.nom
            property bool v:false
            maximumLength: 15
            validator : RegExpValidator { regExp : /^\S+$[^@\^\+\*#~¿?¡!.\/]+^\S+$/ }
            onTextChanged: r.nom=text
            //Keys.onReturnPressed: tiAlVent.focus=true
            //KeyNavigation.tab: tiAlVent
        }
    }
    Text{
        text:'Tipo'
    }
    ComboBox{
       id:cb1
       width: app.fs*10
       model:["TEXTO", "NUMERO"]
       font.pixelSize: app.fs
    }
}


