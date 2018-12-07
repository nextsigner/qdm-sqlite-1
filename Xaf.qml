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
                text:'<b>Ejecutar Aplicaciòn</b>'
                font.pixelSize: app.fs
                onClicked: ejecutarApp()
                Keys.onReturnPressed: ejecutarApp()
          }
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
        c+='    width: '+xa1.an+'\n'
        c+='    height: '+xa1.al+'\n'
        c+='    color: "'+xa1.color+'"\n'
        c+='    title: "'+xa0.nomApp+'"\n'
        c+=xa1.maximizado?'    visibility: "Maximized"\n':xa1.fullScreen?'    visibility: "FullScreen"\n':'    visibility: "Windowed\n"'
        c+='    property int fs: width*0.03\n'
        c+='    property int area: 0\n'
        c+='    onClosing: {\n'
        c+='        close.accepted=false\n'
        c+='        unik.sqliteClose()\n'
        c+='        Qt.quit()\n'
        c+='    }\n'

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

        c+='    SqliteList{\n'
        c+='        visible:app.area===0\n'
        c+='        width: parent.width\n'
        c+='        height:parent.height-app.fs*1.4\n'
        c+='        y: app.fs*1.4\n'
        c+='    }\n'

        c+='    SqliteIns{\n'
        c+='        visible:app.area===1\n'
        c+='        width: parent.width-app.fs\n'
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
        var an=('id,'+xa3.arrNomCols).split(',')
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
        c+='    id:r\n'
        c+='    clip: true\n'
        c+='    property int anColId: app.fs\n'

        c+='    onVisibleChanged: {\n'
        c+='        if(visible){\n'
        c+='            actualizarLista()\n'
        c+='         }\n'
        c+='    }\n'

        var anchoColId=(''+xa3.cantCols).length

        //-->Cab
        c+='        Rectangle{\n'
        c+='            id:xh\n'
        c+='            z:lv.z+1\n'
        c+='            width: parent.width\n'
        c+='            height: app.fs*1.4\n'
        c+='            border.width:2\n'
        c+='            border.color:"gray"\n'
        c+='            color:"#666666"\n'
        c+='            clip:true\n'
        c+='            Row{\n'
        c+='                anchors.centerIn: parent\n'
        c+='                spacing: app.fs*0.5\n'
        for(i=0;i<xa3.cantCols+1;i++){
            if(i!==0){
                c+='                Rectangle{\n'
                c+='                    width:2\n'
                c+='                    height:xh.height\n'
                c+='                    color:"white"\n'
                c+='                }\n'
            }
            c+='                Text{\n'
            c+='                    id:ch'+i+'\n'
            c+='                    text:"'+an[i]+'"\n'
            c+='                    color:"white"\n'
            //c+='                    wrapMode: Text.WrapAnywhere\n'
            c+='                    anchors.verticalCenter: parent.verticalCenter\n'
            c+='                    font.pixelSize:app.fs\n'
            c+=i===0?'                    width:r.anColId\n':'                    width:(xh.parent.width-(r.anColId))/'+parseInt(xa3.cantCols+1)+'\n'
            c+='                    onContentHeightChanged:{\n'
            c+='                        if(contentHeight>parent.parent.height){\n'
            c+='                                parent.parent.height=contentHeight+app.fs\n'
            c+='                        }\n'
            c+='                    }\n'
            c+='                }\n'
        }
        c+='            }\n'
        c+='        }\n'
        //--Cab

        c+='    ListView{\n'//-->1
        c+='                id: lv\n'
        c+='                width: parent.width\n'
        c+='                height: parent.height-xh.height\n'
        c+='                anchors.top: xh.bottom\n'
        c+='                clip: true\n'
        c+='                delegate:del\n'
        c+='                model:lm\n'
        c+='                ScrollBar.vertical: ScrollBar { }\n'
        c+='    }\n'//--1

        c+='    ListModel{\n'//-->2
        c+='        id: lm\n'
        c+='        function add('
        for(i=0;i<xa3.cantCols+1;i++){
            if(i===0){
                c+='vt'+i
            }else{
                c+=',vt'+i
            }
        }
        c+='){\n'
        c+='                return{\n'

        for(i=0;i<xa3.cantCols+1;i++){
            if(i===0){
                c+='t'+i+': vt'+i+''
            }else{
                c+=',\nt'+i+': vt'+i
            }
        }
        c+='                }\n'
        c+='        }\n'
        c+='    }\n'//--2

        c+='    Component{\n'//-->Componente-1
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
        for(i=0;i<xa3.cantCols+1;i++){
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
            c+='                    anchors.verticalCenter: parent.verticalCenter\n'
            c+='                    font.pixelSize:app.fs\n'
            c+=i===0?'                    width:r.anColId\n':'                    width:(xr.parent.width-(r.anColId))/'+parseInt(xa3.cantCols+1)+'\n'
            c+='                    onContentHeightChanged:{\n'
            c+='                        if(contentHeight>parent.parent.height){\n'
            c+='                                parent.parent.height=contentHeight+app.fs\n'
            c+='                        }\n'
            c+='                    }\n'
            if(i===0){
                c+='                    Component.onCompleted:{\n'
                c+='                        if(contentWidth>r.anColId){\n'
                c+='                            r.anColId=contentWidth\n'
                c+='                        }\n'
                c+='                    }\n'
            }
            c+='                }\n'

        }
        c+='            }\n'


        c+='        }\n'
        c+='    }\n'//--Componente-1


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
        c+='    anchors.horizontalCenter:parent.horizontalCenter\n'
        c+='    Flickable{\n'//-->1
        c+='        anchors.fill:parent\n'
        c+='        contentWidth:r.width\n'
        c+='        contentHeight:col1.height\n'
        c+='        ScrollBar.vertical: ScrollBar { }\n'
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

