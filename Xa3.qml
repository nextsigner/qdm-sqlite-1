import QtQuick 2.0
import QtQuick.Controls 2.0
import Qt.labs.settings 1.0

Item {
    id:r
    anchors.fill: parent
    opacity: visible?1.0:0.0
    property alias cantCols: rs.cantCols
    property alias arrNomCols: rs.arrNomCols
    property alias arrTipoCols: rs.arrTipoCols
    onVisibleChanged:{
        if(visible){
            tiCantCols.focus=true
        }
    }
    Behavior on opacity{NumberAnimation{duration:1500}}
    Settings{
        id:rs
        category:'conf-'+app.moduleName+'-area3'
        property int cantCols
        property string arrNomCols
        property string arrTipoCols
    }
    Flickable{
        width: r.width
        height: r.height
        contentHeight: col1.height
        ScrollBar.vertical: ScrollBar { }
        Column{
            id:col1
            spacing: app.fs*0.5
           anchors.horizontalCenter: parent.horizontalCenter
            Row{
                spacing: app.fs*0.5
                height: app.fs*1.4
                Text{
                    text:'Cantidad de Columnas'
                    font.pixelSize: app.fs
                    color:app.c2
                }
                Rectangle{
                    width: app.fs*2
                    height: app.fs*1.4
                    border.width: 2
                    border.color: app.c2
                    radius: app.fs*0.25
                    color:'transparent'
                    TextInput{
                        id:tiCantCols
                        font.pixelSize: app.fs
                        width: parent.width-app.fs
                        height: app.fs
                        anchors.centerIn: parent
                        color:app.c2
                        text: rs.cantCols
                        maximumLength: 2
                        validator : RegExpValidator { regExp : /[0-9]{2}/ }
                        Keys.onReturnPressed: botSiguiente.focus=true
                        KeyNavigation.tab: botSiguiente
                        onTextChanged: {
                            rs.cantCols=parseInt(text)
                            setCols()
                        }
                    }
                }
            }
            Column{
                id:cc
                spacing: app.fs*0.25
                height: (children.length)*app.fs*1.4+((children.length-1)*app.fs*0.25)
            }
            Button{
                id:botSiguiente
                text:'<b>Siguiente</b>'
                font.pixelSize: app.fs
                onClicked: next()
                Keys.onReturnPressed: next()
                anchors.right: parent.right
            }
        }
    }
    Component.onCompleted: {
        if(rs.arrNomCols.length<=0){
            rs.arrNomCols=[]
        }
        if(rs.cantCols<=0){
            rs.cantCols=1
        }
        setCols()
    }
    function next(){
        r.parent.a++
        rs.arrNomCols=''
        rs.arrTipoCols=''
        var v=0
        for(var i=0;i<cc.children.length;i++){
            if(i===0){
                rs.arrNomCols+=''+cc.children[i].nom
                rs.arrTipoCols+=''+cc.children[i].t
            }else{
                rs.arrNomCols+=','+cc.children[i].nom
                rs.arrTipoCols+=','+cc.children[i].t
            }
            v++
        }
    }


    function setCols(){
        var c
        var obj
        for(var i=0;i<cc.children.length;i++){
            cc.children[i].destroy(0)
        }
        for(var i=0;i<parseInt(tiCantCols.text);i++){
            var n
            var n2=0
            var arrnl=rs.arrNomCols.split(',')
            var arrnl2=rs.arrTipoCols.split(',')
            if(i<arrnl.length){
                n=''+arrnl[i]
                n2=parseInt(arrnl2[i])
            }else{
                n='col'+i
            }
            c=Qt.createComponent('Fnc.qml')
            obj=c.createObject(cc, {"nom": ""+n, "t": n2});
        }
    }
}

