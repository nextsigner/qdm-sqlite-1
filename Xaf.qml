import QtQuick 2.0
import QtQuick.Controls 2.0
import Qt.labs.settings 1.0

Item {
    id:r
    anchors.fill: parent
    opacity: visible?1.0:0.0
    //    onVisibleChanged:{
    //        if(visible){
    //            tiCantCols.focus=true
    //        }
    //    }
    Behavior on opacity{NumberAnimation{duration:1500}}
    //    Settings{
    //        id:rs
    //        category:'conf-'+app.moduleName+'-area3'
    //        property int cantCols
    //        property string arrNomCols
    //        property string arrTipoCols
    //    }
    Column{
        id:col1
        spacing: app.fs*0.5
        anchors.centerIn: r
        Text{
            text:'Finalizar con la creaciòn de la Aplicaciòn'
            font.pixelSize: app.fs
            color:app.c2
        }
        Row{
            spacing: app.fs*0.5
            height: app.fs*1.4
            Text{
                text:'Finalizar con la creaciòn de la Aplicaciòn'
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
        Button{
            id:botSiguiente
            text:'<b>Ejecutar Aplicaciòn</b>'
            font.pixelSize: app.fs
            onClicked: ejecutarApp()
            Keys.onReturnPressed: ejecutarApp()
            anchors.right: parent.right
        }
    }

    Component.onCompleted: {

    }
    function ejecutarApp(){
        var carpetaDestino=appsDir+'/'+xa0.nomApp
        console.log('Carpeta de Destino: '+carpetaDestino)
        unik.mkdir(carpetaDestino)

        unik.sqliteInit(xa0.nomApp+'.sqlite')
        var c0="drop table if exists tabla1"
        unik.sqlQuery(c0)

        var c=''

        c+='import QtQuick 2.0\n'
        c+='import QtQuick.Controls 2.0\n'
        c+='ApplicationWindow{\n'
        c+='    id: app\n'
        c+='    visible: true\n'
        c+='    width: 500\n'
        c+='    height: 500\n'
        c+='    color: "red"\n'
        c+='    title: "'+xa0.nomApp+'"\n'
        c+=xa1.maximizado?'    visibility: "Maximized"\n':''
        c+='    property int fs: width*0.03\n'
        c+='    property int area: 0\n'

        c+='    Row{\n'//-->4
        c+='            height: app.fs*1.4\n'
        c+='        Repeater{\n'
        c+='            model:["Lista de Registros", "Insertar Registros"]\n'
        c+='            Rectangle{\n'
        c+='                border.width: 2\n'
        c+='                width:app.width/2\n'
        c+='                height:app.fs*1.4\n'
        c+='                opacity:index===app.area?1.0:0.5\n'
        c+='                Text{\n'
        c+='                    text:modelData\n'
        c+='                    font.pixelSize: app.fs\n'
        c+='                    anchors.centerIn: parent\n'
        c+='                }\n'
        c+='                MouseArea{\n'
        c+='                    anchors.fill:parent\n'
        c+='                    onClicked: app.area=index\n'
        c+='                }\n'
        c+='            }\n'
        c+='        }\n'
        c+='    }\n'//--4

        c+='    SqliteList{visible:app.area===0}\n'

        c+='    SqliteIns{\n'
        c+='        visible:app.area===1\n'
        c+='        width: parent.width\n'
        c+='        height:parent.height-app.fs*1.4\n'
        c+='        y: app.fs*1.4\n'
        c+='    }\n'

        c+='    Component.onCompleted:{\n'
        c+='        unik.sqliteInit("'+xa0.nomApp+'.sqlite")\n'


        //c+='        var c0="drop table if exists tabla1"\n'
        //c+='        unik.sqlQuery(c0)\n'


        c+='        var c1="CREATE TABLE IF NOT EXISTS tabla1("\n'
        c+='                c1+="id INTEGER PRIMARY KEY AUTOINCREMENT"\n'


        var a1=(''+xa3.arrNomCols).split(',')
        var a2=(''+xa3.arrTipoCols).split(',')
        for(var i=0;i<xa3.cantCols;i++){
            var t=parseInt(a2[i])===0?'TEXT':'NUMERIC'
            c+='                c1+=",'+a1[i]+' '+t+'"\n'
        }
        c+='        c1+=")"\n'
        c+='        unik.sqlQuery(c1)\n'
        c+='    }\n'

        c+='}\n'
        unik.setFile(carpetaDestino+'/main.qml', c)



        //Modulo Lista
        c=''
        c+='import QtQuick 2.0\n'
        c+='import QtQuick.Controls 2.0\n'
        c+='Item{\n'
        c+='    anchors.fill: parent\n'

        c+='    onVisibleChanged: {\n'
        c+='        if(visible){\n'
        c+='            actualizarLista()\n'
        c+='         }\n'
        c+='    }\n'

        c+='    ListView{\n'//-->1
        c+='                width: parent.width\n'
        c+='                height: parent.height-app.fs*1.4\n'
        c+='                y: app.fs*1.4\n'
        c+='                clip: true\n'
        c+='                delegate:del\n'
        c+='                model:lm\n'
        c+='    }\n'//--1

        var a1=(''+xa3.arrNomCols).split(',')
        var a2=(''+xa3.arrTipoCols).split(',')
        c+='    ListModel{\n'//-->2
        c+='        id: lm\n'
        c+='        function add('
        for(var i=0;i<xa3.cantCols+1;i++){
            if(i===0){
                c+='vt'+i
            }else{
                c+=',vt'+i
            }
        }
        c+='){\n'
        c+='                return{\n'

        var anchoColId=(''+xa3.cantCols).length
        for(var i=0;i<xa3.cantCols+1;i++){
            if(i===0){
                c+='t'+i+': vt'+i+''
            }else{
                c+=',\nt'+i+': vt'+i
            }
        }
        c+='                }\n'
        c+='        }\n'
        c+='    }\n'//--2

        c+='    Rectangle{\n'//-->3
        c+='        id: xIns\n'

        c+='    }\n'//--3



        c+='    Component{\n'
        c+='                id:del\n'
        c+='        Rectangle{\n'
        c+='            id:xr\n'
        c+='            width: parent.width\n'
        c+='            height: app.fs*1.4\n'
        c+='            radius:6\n'
        c+='            border.width:2\n'
        c+='            border.color:"gray"\n'
        c+='            clip:true\n'
        c+='            Row{\n'
        c+='                anchors.centerIn: parent\n'
        c+='                spacing: app.fs*0.5\n'
        for(var i=0;i<xa3.cantCols+1;i++){
            if(i!==0){
                c+='                Rectangle{\n'
                c+='                    width:2\n'
                c+='                    height:xr.height\n'
                c+='                    color:"gray"\n'
                c+='                }\n'
            }
            c+='                Text{\n'
            c+='                    id:c'+i+'\n'
            c+='                    text:t'+i+'\n'
            c+='                    wrapMode: Text.WrapAnywhere\n'
            //c+='                    horizontalAlignment: Text.AlignHCenter\n'
            c+='                    font.pixelSize:app.fs\n'
            c+=i===0?'                    width:app.fs*'+anchoColId+'\n':'                    width:(xr.parent.width-(c0.contentWidth+app.fs*0.5))/'+parseInt(xa3.cantCols+1)+'\n'
            c+='                    onContentHeightChanged:{\n'
            c+='                        if(contentHeight>parent.parent.height){\n'
            c+='                                parent.parent.height=contentHeight+app.fs\n'
            c+='                        }\n'
            c+='                    }\n'
            c+='                }\n'

        }
        c+='            }\n'


        c+='        }\n'
        c+='    }\n'


        c+='    function actualizarLista(){\n'//-->actualizarLista()
        c+='        lm.clear()\n'
        c+='        var filas=unik.getSqlData("select * from tabla1")\n'

        c+='        for(var i=0;i<filas.length;i++){\n'
        c+='            lm.append(lm.add( '
        for(var i=0;i<xa3.cantCols+1;i++){
            if(i===0){
                c+='filas[i].col['+i+']'
            }else{
                c+=', filas[i].col['+i+']'
            }
        }
        c+='))\n'
        c+='        }\n'
        c+='    }\n'//--actualizarLista()

        c+='    Component.onCompleted:{\n'
        c+='        actualizarLista()\n'
        c+='    }\n'

        c+='}\n'
        unik.setFile(carpetaDestino+'/SqliteList.qml', c)


        //Modulo Insertar
        c=''
        c+='import QtQuick 2.0\n'
        c+='import QtQuick.Controls 2.0\n'
        c+='Item{\n'
        c+='    id:r\n'

        c+='    Flickable{\n'//-->1
        c+='        anchors.fill:parent\n'
        c+='        contentWidth:parent.width\n'
        c+='        contentHeight:col1.height\n'
        c+='        Column{\n'//-->2
        c+='            id:col1\n'
        c+='            spacing: app.fs*2\n'


        for(var i=0;i<xa3.cantCols;i++){
            c+=parseInt(a2[i])===0?'        Column{\n':'        Row{\n'//-->3
            c+='           spacing: app.fs*0.5\n'
            c+='            Text{\n'
            c+='                text:"'+a1[i]+': "\n'
            c+='                font.pixelSize: app.fs\n'
            c+='                height: app.fs\n'
            c+='             }\n'
            c+='             Rectangle{\n'
            c+=parseInt(a2[i])===0?'                 width: r.width\n':'                 width: app.fs*8\n'
            c+='                 height: app.fs*1.4\n'
            c+='                 border.width: 2\n'
            c+='                 radius: app.fs*0.25\n'
            c+='                 //color:"transparent"\n'
            c+='                 clip: true\n'
            c+='                 TextInput{\n'
            c+='                    id:tiDato'+i+'\n'
            c+='                    font.pixelSize: app.fs\n'
            c+='                    width: parent.width-app.fs\n'
            c+='                    height: app.fs\n'
            c+='                   anchors.centerIn: parent\n'
            //c+='                  //validator : RegExpValidator { regExp : /[0-9]{2}/ }\n'
            c+=parseInt(a2[i])===1?'            validator : RegExpValidator { regExp : /[0-9.                                               ]+/ }\n':'            validator : RegExpValidator { regExp :  /.+/ }\n'//-->3
            c+='                 }\n'
            c+='             }\n'

            c+='         }\n'//--3
        }

        c+='         Button{\n'
        c+='            id:botInsertar\n'
        c+='            text:"<b>Insertar</b>"\n'
        c+='            font.pixelSize: app.fs\n'
        c+='            onClicked: r.insertar()\n'
        c+='            Keys.onReturnPressed: r.insertar()\n'
        c+='            anchors.right: parent.right\n'
        c+='         }\n'

        c+='        }\n'//--2


        c+='    }\n'//--1

        c+='         function insertar(){\n'//-->5
        c+='            var sql=\'INSERT INTO tabla1('
        for(var i=0;i<xa3.cantCols;i++){
            if(i===0){
                c+='\\\''+a1[i]+'\\\''
            }else{
                c+=', \\\''+a1[i]+'\\\''
            }
        }
        c+=')VALUES('
        for(var i=0;i<xa3.cantCols;i++){
            if(i===0){
                if(parseInt(a2[i])!==1){
                    c+='\\\'\'+tiDato'+i+'.text+\'\\\''
                }else{
                    c+='\'+tiDato'+i+'.text+\''
                }

            }else{
                if(parseInt(a2[i])!==1){
                    c+=', \\\'\'+tiDato'+i+'.text+\'\\\''
                }else{
                    c+=', \'+tiDato'+i+'.text+\''
                }
            }
        }
        c+='\' \n'
        c+='            sql+=")"\n'
        c+='            console.log("Sqlite: "+sql)\n'
        c+='            unik.sqlQuery(sql)\n'
        c+='         }\n'//--5

        c+='    }\n'
        unik.setFile(carpetaDestino+'/SqliteIns.qml', c)

        unik.ejecutarLineaDeComandoAparte('"'+appExec+'" -cfg -folder='+carpetaDestino)
    }
}

