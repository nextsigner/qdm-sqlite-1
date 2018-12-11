import QtQuick 2.0
import QtQuick.Controls 2.0

Row{
    id:r
    height: app.fs*1.4
    spacing: app.fs*0.5
    property int index
    property bool islast:false
    property string nom
    property alias t: cb1.currentIndex
    property alias f: tiNomCol.focus

    Rectangle{
        width: app.fs*12
        height: app.fs*1.4
        border.width: 2
        border.color: app.c2
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
            maximumLength: 15
            validator : RegExpValidator { regExp : /^\S+$[^@\^\+\*#~¿?¡!.\/]+^\S+$/ }
            onTextChanged: r.nom=text
            KeyNavigation.tab: cb1
        }
    }
    UnikComboBox{
        id:cb1
        Keys.onTabPressed: {
            if(!r.islast){
                r.parent.next(r.index)
            }else{
                r.parent.asig()
            }

        }
    }
}


