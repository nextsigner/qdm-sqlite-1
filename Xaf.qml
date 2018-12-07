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

        if(r.parent.cambiaTabla){
            unik.sqliteInit(xa2.nomBD+'.sqlite')
            var c0="drop table if exists tabla1"
            unik.sqlQuery(c0)
        }
        var c=''
        c+='import QtQuick 2.9\n'
        c+='import QtQuick.Controls 2.0\n'
        c+='ApplicationWindow{\n'
        c+='    id: app\n'
        c+='    visible: true\n'
        c+='    width: '+xa1.an+'\n'
        c+='    height: '+xa1.al+'\n'
        c+='    color: "'+xa1.color+'"\n'
        c+='    title: "'+xa0.nomApp+'"\n'
        c+=xa1.maximizado?'    visibility: "Maximized"\n':xa1.fullScreen?'    visibility: "FullScreen"\n':'    visibility: "Windowed"\n'
        c+='    property int fs: width*0.03\n'
        c+='    property int area: 0\n'
        c+='    onClosing: {\n'
        c+='        close.accepted=false\n'
        c+='        unik.sqliteClose()\n'
        c+='        Qt.quit()\n'
        c+='    }\n'

        c+='    Item{\n'//-->Item xApp
        c+='        id:xApp\n'
        c+='        anchors.fill: parent\n'
        c+='        focus:true\n'

        c+='Shortcut{\n'
        c+='    sequence:"Shift+Left"\n'
        c+='    onActivated:{\n'
        c+='        app.area=app.area>0?app.area-1:2\n'
        c+='    }\n'
        c+='}\n'
        c+='Shortcut{\n'
        c+='    sequence:"Shift+Right"\n'
        c+='    onActivated:{\n'
        c+='        app.area=app.area<2?app.area+1:0\n'
        c+='    }\n'
        c+='}\n'




        c+='    Row{\n'//-->4
        c+='            height: app.fs*1.4\n'
        c+='        Repeater{\n'
        c+='            model:["Lista de Registros", "Insertar Registros", "Editar Registro"]\n'
        c+='            Rectangle{\n'
        c+='                border.width: 3\n'
        c+='                width:app.width/3\n'
        c+='                height:app.fs*1.4\n'
        c+='               color: "'+xa1.colorLetra+'"\n'
        c+='                opacity:index===app.area?1.0:0.5\n'
        c+='                Text{\n'
        c+='                    text:modelData\n'
        c+='                    font.pixelSize: app.fs*0.6\n'
        c+='                    anchors.centerIn: parent\n'
        c+='                   color: "'+xa1.color+'"\n'
        c+='                }\n'
        c+='                MouseArea{\n'
        c+='                    anchors.fill:parent\n'
        c+='                    onClicked: app.area=index\n'
        c+='                }\n'
        c+='            }\n'
        c+='        }\n'
        c+='    }\n'//--4

        c+='    SqliteList{\n'
        c+='        id: xList\n'
        c+='        visible:app.area===0\n'
        c+='        width: parent.width\n'
        c+='        height:parent.height-app.fs*1.4\n'
        c+='        y: app.fs*1.4\n'
        c+='    }\n'

        c+='    SqliteIns{\n'
        c+='        visible:app.area===1\n'
        c+='        width: parent.width\n'
        c+='        height:parent.height-app.fs*1.4\n'
        c+='        y: app.fs*1.4\n'
        c+='    }\n'

        c+='    SqliteMod{\n'
        c+='        id: xMod\n'
        c+='        visible:app.area===2\n'
        c+='        width: parent.width\n'
        c+='        height:parent.height-app.fs*1.4\n'
        c+='        y: app.fs*1.4\n'
        c+='    }\n'

        c+='       }\n'//--Item xApp

        c+='    Component.onCompleted:{\n'
        c+='        unik.sqliteInit("'+xa2.nomBD+'.sqlite")\n'

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
        c+='    property alias cbBCI: cbCol.currentIndex\n'
        c+='    property alias txtBusc: tiBuscar.text\n'


        c+='    onVisibleChanged: {\n'
        c+='        if(visible){\n'
        c+='            actualizarLista()\n'
        c+='         }\n'
        c+='    }\n'

        var anchoColId=(''+xa3.cantCols).length


        //-->Buscador
        c+='        Rectangle{\n'
        c+='            id:xb\n'
        c+='            z:lv.z+2\n'
        c+='            width: parent.width\n'
        c+='            height: app.fs*1.8\n'
        c+='            border.width:2\n'
        c+='            border.color:"gray"\n'
        c+='            color: "'+xa1.color+'"\n'
        c+='             Row{\n'
        c+='                spacing: app.fs*0.5\n'
        c+='                anchors.centerIn: parent\n'
        c+='                Text{\n'
        c+='                    id: txtBuscar\n'
        c+='                    text:"Buscar: "\n'
        c+='                    font.pixelSize: app.fs\n'
        c+='                    color: "'+xa1.colorLetra+'"\n'
        c+='                }\n'

        c+='              ComboBox{\n'//-->cbCol
        c+='                    id: cbCol\n'
        c+='                    font.pixelSize: app.fs\n'
        c+='                    width: app.fs*8\n'
        c+='                    height: app.fs*1.4\n'
        c+='                    currentIndex: 1\n'
        c+='                    model:['
        for(i=0;i<an.length;i++){
            if(i===0){
                c+='"'+an[i]+'"'
            }else{
                c+=',"'+an[i]+'"'
            }
        }
        c+=']\n'
        c+='                onCurrentIndexChanged: {\n'
        c+='                    actualizarLista()\n'
        c+='                }\n'
        c+='                }\n'//--cbCol

        c+='             Rectangle{\n'
        c+='                 width: r.width-txtBuscar.contentWidth-cbCol.width-app.fs*2\n'
        c+='                 height: app.fs*1.4\n'
        c+='                color: "'+xa1.color+'"\n'
        c+='                 border.width: 2\n'
        c+='                 border.color: "'+xa1.colorLetra+'"\n'
        c+='                 radius: app.fs*0.25\n'
        c+='                 clip: true\n'
        c+='                 TextInput{\n'
        c+='                    id:tiBuscar\n'
        c+='                    color: "'+xa1.colorLetra+'"\n'
        c+='                    font.pixelSize: app.fs\n'
        c+='                    width: parent.width-app.fs\n'
        c+='                    height: app.fs\n'
        c+='                   anchors.centerIn: parent\n'
        c+='                    onTextChanged: {\n'
        c+='                        actualizarLista()\n'
        c+='                    }\n'
        c+='                 }\n'
        c+='             }\n'

        c+='            }\n'
        c+='         }\n'
        //--Buscador

        //-->Cab
        c+='        Rectangle{\n'
        c+='            id:xh\n'
        c+='            z:lv.z+1\n'
        c+='            width: parent.width\n'
        c+='            height: app.fs*1.4\n'
        c+='           anchors.top: xb.bottom\n'
        c+='            color: "'+xa1.color+'"\n'
        c+='            border.width:2\n'
        c+='            border.color: "'+xa1.colorLetra+'"\n'
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
            c+='                    text:"'+(''+an[i]).replace(/_/g,' ')+'"\n'
            c+='                    color: "'+xa1.colorLetra+'"\n'
            c+='                    horizontalAlignment:Text.AlignHCenter\n'
            c+='                    wrapMode: Text.WrapAnywhere\n'
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
        c+='                height: parent.height-xh.height-xb.height\n'
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
        c+='            color: "'+xa1.color+'"\n'
        c+='            border.width:2\n'
        c+='            border.color: "'+xa1.colorLetra+'"\n'
        c+='            clip:true\n'
        c+='            Row{\n'
        c+='                anchors.centerIn: parent\n'
        c+='                spacing: app.fs*0.5\n'
        for(i=0;i<xa3.cantCols+1;i++){
            if(i!==0){
                c+='                Rectangle{\n'
                c+='                    width:2\n'
                c+='                    height:xr.height\n'
                c+='                    color: "'+xa1.colorLetra+'"\n'
                c+='                }\n'
            }
            c+='                Text{\n'
            c+='                    id:c'+i+'\n'
            c+='                    text:t'+i+'\n'
            c+='                     color: "'+xa1.colorLetra+'"\n'
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
                c+='                    MouseArea{\n'
                c+='                        anchors.fill: parent\n'
                c+='                        onDoubleClicked: {\n'
                c+='                            xMod.currentId=parseInt(c0.text)\n'
                c+='                            app.area=2\n'
                c+='                        }\n'
                c+='                    }\n'

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
        c+='        var sql\n'
        c+='        if(tiBuscar.text===""){\n'
        c+='            sql="select * from tabla1"\n'
        c+='        }else{\n'
        c+='            sql="select * from tabla1 where "+cbCol.currentText+" like \\\'%"+tiBuscar.text+"%\\\'"\n'
        c+='        }\n'
        c+='        var filas=unik.getSqlData(sql)\n'

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
        c+='    clip: true\n'
        c+='    Flickable{\n'//-->1
        c+='        anchors.fill:parent\n'
        c+='        contentWidth:r.width\n'
        c+='        contentHeight:col1.height\n'
        c+='        ScrollBar.vertical: ScrollBar { }\n'
        c+='        Column{\n'//-->2
        c+='            id:col1\n'
        c+='            spacing: app.fs*2\n'
        c+='           anchors.horizontalCenter: parent.horizontalCenter\n'


        for(var i=0;i<xa3.cantCols;i++){
            c+=parseInt(a2[i])===0?'        Column{\n':'        Row{\n'//-->3
            c+='           spacing: app.fs*0.5\n'
            c+='           anchors.horizontalCenter: parent.horizontalCenter\n'
            c+='            Text{\n'
            c+='                text:"'+a1[i]+': "\n'
            c+='                font.pixelSize: app.fs\n'
            c+='                height: app.fs\n'
            c+='                color: "'+xa1.colorLetra+'"\n'
            c+='             }\n'
            c+='             Rectangle{\n'
            c+=parseInt(a2[i])===0?'                 width: r.width-app.fs\n':'                 width: app.fs*8\n'
            c+='                 height: app.fs*1.4\n'
            c+='                 color: "'+xa1.color+'"\n'
            c+='                 border.width: 2\n'
            c+='                 border.color: "'+xa1.colorLetra+'"\n'
            c+='                 radius: app.fs*0.25\n'
            c+='                 clip: true\n'
            c+='                 TextInput{\n'
            c+='                    id:tiDato'+i+'\n'
            c+='                    color: "'+xa1.colorLetra+'"\n'
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

        //Modulo Editar
        c=''
        c+='import QtQuick 2.0\n'
        c+='import QtQuick.Controls 2.0\n'
        c+='Item{\n'
        c+='    id:r\n'
        c+='    anchors.horizontalCenter:parent.horizontalCenter\n'
        c+='    property int currentId: -1\n'
        c+='    clip: true\n'

        c+='    onCurrentIdChanged: {\n'
        c+='        var sql=\'select * from tabla1 where id=\'+currentId+\'\'\n'
        c+='        var filas=unik.getSqlData(sql)\n'

        c+='        for(var i=0;i<filas.length;i++){\n'
        for(var i=0;i<xa3.cantCols+1;i++){
            c+='tiDato'+i+'.text=filas[i].col['+parseInt(i+1)+']\n'
        }
        c+='        }\n'
        c+='    }\n'

        c+='    Flickable{\n'//-->1
        c+='        anchors.fill:parent\n'
        c+='        contentWidth:r.width\n'
        c+='        contentHeight:col1.height\n'
        c+='        ScrollBar.vertical: ScrollBar { }\n'
        c+='        Column{\n'//-->2
        c+='            id:col1\n'
        c+='            spacing: app.fs*2\n'
        c+='           anchors.horizontalCenter: parent.horizontalCenter\n'


        for(var i=0;i<xa3.cantCols;i++){
            c+=parseInt(a2[i])===0?'        Column{\n':'        Row{\n'//-->3
            c+='           spacing: app.fs*0.5\n'
            c+='           anchors.horizontalCenter: parent.horizontalCenter\n'
            c+='            Text{\n'
            c+='                text:"'+a1[i]+': "\n'
            c+='                color: "'+xa1.colorLetra+'"\n'
            c+='                font.pixelSize: app.fs\n'
            c+='                height: app.fs\n'
            c+='             }\n'
            c+='             Rectangle{\n'
            c+=parseInt(a2[i])===0?'                 width: r.width-app.fs\n':'                 width: app.fs*8\n'
            c+='                 height: app.fs*1.4\n'
            c+='                 color: "'+xa1.color+'"\n'
            c+='                 border.width: 2\n'
            c+='                 border.color: "'+xa1.colorLetra+'"\n'
            c+='                 radius: app.fs*0.25\n'
            c+='                 clip: true\n'
            c+='                 TextInput{\n'
            c+='                    id:tiDato'+i+'\n'
            c+='                    color: "'+xa1.colorLetra+'"\n'
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
        c+='            id:botModificar\n'
        c+='            text:"<b>Modificar</b>"\n'
        c+='            font.pixelSize: app.fs\n'
        c+='            onClicked: r.modificar()\n'
        c+='            Keys.onReturnPressed: r.modificar()\n'
        c+='            anchors.right: parent.right\n'
        c+='         }\n'

        c+='        }\n'//--2


        c+='    }\n'//--1

        c+='         function modificar(){\n'//-->5
        c+='            var sql=\'UPDATE tabla1 SET '
        for(var i=0;i<xa3.cantCols;i++){
            if(i===0){
                if(parseInt(a2[i])!==1){
                    c+=' '+a1[i]+'=\\\'\'+tiDato'+i+'.text+\'\\\''
                }else{
                    c+=' '+a1[i]+'=\'+tiDato'+i+'.text+\''
                }
            }else{
                if(parseInt(a2[i])!==1){
                    c+=' ,'+a1[i]+'=\\\'\'+tiDato'+i+'.text+\'\\\''
                }else{
                    c+=' ,'+a1[i]+'=\'+tiDato'+i+'.text+\''
                }
            }
        }
        c+=' WHERE id=\'+r.currentId+\'\'\n'
        c+='            console.log("Sqlite Modificando: "+sql)\n'
        c+='            unik.sqlQuery(sql)\n'

        c+='            xList.txtBusc=""+r.currentId\n'
        c+='            xList.cbBCI=0\n'
        c+='            app.area=0\n'

        c+='         }\n'//--5

        c+='    }\n'
        unik.setFile(carpetaDestino+'/SqliteMod.qml', c)

        unik.ejecutarLineaDeComandoAparte('"'+appExec+'" -cfg -folder='+carpetaDestino)
    }
}

