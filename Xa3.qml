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
            spCantCols.focus=true
        }
    }
    Behavior on opacity{NumberAnimation{duration:1500}}
    Settings{
        id:rs
        category:'conf-'+app.moduleName+'-area3'
        property int cantCols
        property string arrNomCols
        property string arrTipoCols
        onArrNomColsChanged: r.parent.cambiaTabla=true
        onArrTipoColsChanged: r.parent.cambiaTabla=true
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
                SpinBox{
                    id:spCantCols
                    from: 1
                    to: 8
                    height: app.fs*1.4
                    font.pixelSize: app.fs
                    value: parseInt(rs.cantCols)
                    KeyNavigation.tab: cc.children[0].f=true
                    onValueChanged:  {
                        rs.cantCols=value
                        setCols()
                    }
                }
            }
            Column{
                id:cc
                spacing: app.fs*0.25
                height: (children.length)*app.fs*1.4+((children.length-1)*app.fs*0.25)
                function next(i){
                    cc.children[i+1].f=true
                }
                function asig(){
                    botSiguiente.focus=true
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
                    onClicked: next()
                    Keys.onReturnPressed: next()
                }
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
        for(var i=0;i<spCantCols.value;i++){
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
            var isLast=spCantCols.value-1===i
            c=Qt.createComponent('Fnc.qml')
            obj=c.createObject(cc, {"nom": ""+n, "t": n2, "index": i, "islast": isLast});
        }
    }
}

