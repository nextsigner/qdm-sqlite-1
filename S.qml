import QtQuick 2.0
import  "../../../"
Item {
    id: r
    width: app.an
    height: app.al-app.fs*2

    //1
    Text{
        id:x1
        opacity: 0.0
        Behavior on opacity{NumberAnimation{duration:500}}
        text:'<b>Iniciar Base de Datos Sqlite</b>'
        anchors.centerIn: r
        font.pixelSize: app.fs*2
        color: app.c2
        horizontalAlignment: Text.AlignHCenter
    }

    //2
    Column{
        id:x2
        width: r.width-app.fs
        anchors.centerIn: r
        opacity: 0.0
        spacing: app.fs*0.2
        Behavior on opacity{NumberAnimation{duration:500}}
        Text{
            text:'<b>Còdigo QML - Elemento Item</b>'
            font.pixelSize: app.fs
            color: app.c2
        }
        Row{
            spacing: app.fs*0.5
            Text{
                text:'import'
                font.pixelSize: app.fs
                color: app.c2
            }
            Text{
                text:'QtQuick'
                font.pixelSize: app.fs
                color: app.c2
                Marco{id:mm1;padding:app.fs*0.1}
            }
            Text{
                id:txtVer
                text:'1.4'
                font.pixelSize: app.fs
                color: app.c2
                Marco{id:mm2;padding:app.fs*0.1}
            }
        }
        Text{
            id:txt1
            text:'Item{\n       x:10\n       y:10\n       width:100\n       height:200\n}'
            font.pixelSize: app.fs
            color: app.c2
            Behavior on opacity{NumberAnimation{duration:1500}}
        }
    }

    //3
    Column{
        id:x3
        width: r.width-app.fs
        anchors.centerIn: r
        opacity: 0.0
        spacing: app.fs*0.25
        Behavior on opacity{NumberAnimation{duration:500}}
        Text{
            text:'<b>Posicionador y Contenedor</b>'
            font.pixelSize: app.fs
            color: app.c2
        }
        Row{
            spacing: app.fs
            anchors.horizontalCenter: parent.horizontalCenter
            Xv{
                id:xV1
                width: app.fs*12
                height: app.fs*8
                Loader{
                    objectName: 'Item 1'
                    sourceComponent: item
                    width: xV1.width*0.8
                    height: xV1.height*0.8
                    x:parseInt(app.fs*0.5)
                    y: parseInt(app.fs*0.3)+xV1.tvh
                }
            }
            Xv{
                id:xV2
                width: app.fs*12
                height: app.fs*8
                Loader{
                    objectName:  'Item 2'
                    sourceComponent: item
                    width: xV1.width*0.5
                    height: xV1.height*0.3
                    x:parseInt(app.fs*0.5)
                    y: parseInt(app.fs*0.3)+xV1.tvh
                }
                Loader{
                    objectName:  'Item 3'
                    sourceComponent: item
                    width: xV1.width*0.5
                    height: xV1.height*0.3
                    x:parseInt(app.fs*3)
                    y: parent.height-height-xV1.tvh
                }
            }
        }
        Text{
            text:'<b>Item NO TIENE BORDES.</b><br> Aquì los bordes destellan para saber la ubicaciòn del elemento Item.</b>'
            font.pixelSize: app.fs*0.5
            color: app.c2
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }


    //4
    Column{
        id:x4
        width: r.width-app.fs
        anchors.centerIn: r
        opacity: 0.0
        spacing: app.fs*0.2
        Behavior on opacity{NumberAnimation{duration:500}}
        Text{
            text:'<b>Còdigo QML - Elemento Item</b>'
            font.pixelSize: app.fs
            color: app.c2
        }
        Column{
            spacing: app.fs*0.1
            Text{
                text:'import QtQuick 2.0'
                font.pixelSize: app.fs
                color: app.c2
            }
            Text{
                id:txt2
                text:'Item{'
                font.pixelSize: app.fs
                color: app.c2
            }
            Text{
                text:'      x:10\n      y:15 '
                font.pixelSize: app.fs
                color: app.c2
                Marco{id:mm100;padding:app.fs*0.1}
            }
            Text{
                text:'      width:10'
                font.pixelSize: app.fs
                color: app.c2
                Marco{id:mm101;padding:app.fs*0.1}
            }
            Text{
                text:'      height:10'
                font.pixelSize: app.fs
                color: app.c2
                Marco{id:mm102;padding:app.fs*0.1}
            }
            Text{
                text:'      visible:true'
                font.pixelSize: app.fs
                color: app.c2
                Marco{id:mm103;padding:app.fs*0.1}
            }
            Text{
                text:'      opacity:10'
                font.pixelSize: app.fs
                color: app.c2
                Marco{id:mm104;padding:app.fs*0.1}
            }
            Text{
                text:'}'
                font.pixelSize: app.fs
                color: app.c2
            }
        }
    }

    //5
    Column{
        id:x5
        width: r.width-app.fs
        anchors.centerIn: r
        opacity: 0.0
        spacing: app.fs*0.25
        Behavior on opacity{NumberAnimation{duration:500}}

        Row{
            spacing: app.fs
            anchors.horizontalCenter: parent.horizontalCenter
            Column{
                Text{
                    text:'<b>Còdigo QML - Elemento Item</b>'
                    font.pixelSize: app.fs
                    color: app.c2
                }
                Column{
                    spacing: app.fs*0.1
                    Text{
                        text:'import QtQuick 2.0'
                        font.pixelSize: app.fs
                        color: app.c2
                    }
                    Text{
                        text:'Item{'
                        font.pixelSize: app.fs
                        color: app.c2
                    }
                    Text{
                        text:'      x:10\n      y:15 '
                        font.pixelSize: app.fs
                        color: app.c2
                        Marco{
                            id:mm200;padding:app.fs*0.1
                            Text{
                                text:'Posiciòn'
                                font.pixelSize: app.fs
                                color: app.c2
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.left: parent.right
                                anchors.leftMargin: app.fs
                            }
                        }
                    }
                    Text{
                        text:'      width:'+parseInt(item3.width)+'\n      height: '+parseInt(item3.height)
                        font.pixelSize: app.fs
                        color: app.c2
                        Marco{
                            id:mm201;
                            padding:app.fs*0.1
                            Text{
                                text:'Dimensiones'
                                font.pixelSize: app.fs
                                color: app.c2
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.left: parent.right
                                anchors.leftMargin: app.fs
                            }
                        }
                    }
                    Text{
                        text:'      visible:'+item3.visible
                        font.pixelSize: app.fs
                        color: app.c2
                        Marco{id:mm202;padding:app.fs*0.1}
                    }
                    Text{
                        text:'      opacity:'+parseFloat(item3.opacity).toFixed(1)
                        font.pixelSize: app.fs
                        color: app.c2
                        Marco{id:mm203;padding:app.fs*0.1}
                    }
                    Text{
                        text:'}'
                        font.pixelSize: app.fs
                        color: app.c2
                    }
                }
            }
            Xv{
                id:xV3
                width: app.fs*12
                height: app.fs*8
                anchors.verticalCenter: parent.verticalCenter
                Loader{
                    id:item3
                    objectName: 'Item 3'
                    sourceComponent: item
                    width: app.fs*5.5
                    height: app.fs*3.5
                    x:parseInt(app.fs)
                    y: parseInt(app.fs*0.3)+xV1.tvh
                    property int demo: -1
                    Behavior on x{NumberAnimation{duration:700}}
                    Behavior on y{NumberAnimation{duration:700}}
                    Behavior on width{NumberAnimation{duration:700}}
                    Behavior on height{NumberAnimation{duration:700}}
                }
            }
        }
    }

    //6
    Column{
        id:x6
        // width: r.width-app.fs
        anchors.centerIn: r
        opacity: 0.0
        spacing: app.fs*0.25
        Behavior on opacity{NumberAnimation{duration:500}}
        Xv{
            id:xV4
            tvh:app.fs
            width: app.fs*20
            height: r.height-app.fs*4
            clip:false
            Loader{
                id:item4
                objectName: 'Item 3'
                sourceComponent: itemG
                width: app.fs*10
                height: app.fs*8.5
                x:parseInt(app.fs*2.5)
                y: parseInt(app.fs*3)+xV4.tvh
                property int demo: -1
            }
        }
    }

    //7
    Row{
        id:x7
        // width: r.width-app.fs
        anchors.centerIn: r
        opacity: 0.0
        spacing: app.fs*2
        Behavior on opacity{NumberAnimation{duration:500}}
        Text{
            text:'<b>Elemento Item</b>'
            font.pixelSize: app.fs
            color: app.c2
            anchors.verticalCenter: parent.verticalCenter
            Marco{padding:app.fs}
        }
        Text{
            font.family: 'FontAwesome'
            text:'\uf101'
            font.pixelSize: app.fs
            color: app.c2
            anchors.verticalCenter: parent.verticalCenter
        }
        Item{
            width: col7.width
            height: col7.height
            Marco{
                padding:app.fs
                Text{
                    text:'Heredan Propiedades\nMètodos y Caractarìsticas\ndel Elemento Item Base'
                    horizontalAlignment: Text.AlignHCenter
                    font.pixelSize: app.fs*0.5
                    color: app.c2
                    anchors.bottom: parent.top
                    anchors.bottomMargin: app.fs*0.5
                }
            }
            Column{
            id:col7
            Repeater{
                model: ['Rectangle{}', 'ListView{}', 'WebView{}', 'Text{}', 'TextInput{}', 'Image{}', 'Otros']
                Text{
                    text:'<b>'+modelData+'</b>'
                    font.pixelSize: app.fs
                    color: app.c2
                }
            }
        }
        }
    }

    //8
    Row{
        id:x8
        anchors.centerIn: r
        opacity: 0.0
        spacing: app.fs*2
        Behavior on opacity{NumberAnimation{duration:500}}
        Item{
            id:h1
            width: col8.width
            height: col8.height
            Marco{padding:app.fs*0.5}
            Column {
                id:col8
                spacing: app.fs*0.25
                Text{
                    text: '<b>Noticia de Ecologìa</b>'
                    font.pixelSize: app.fs*0.7
                    color: app.c2
                    anchors.horizontalCenter: parent.horizontalCenter
                    Marco{visible:x8.mv===0;id:mmt1;padding:app.fs*0.2;bc:'red'}
                }
                Text{
                    id:t8p1
                    width: app.fs*20
                    font.pixelSize: app.fs*0.5
                    color: app.c2
                    anchors.horizontalCenter: parent.horizontalCenter
                    wrapMode: Text.WordWrap
                    text:'Desde principios de los años \'80 EEUU ha elaborado un estudio sobre el Calentamiento Global. Sus resultados indicaban que habrìa desastres graves en el medio ambiente a principios del tercer milenio y a finales de la primer dècada de dicho milenio.'
                Marco{visible:x8.mv===1;id:mmt2;padding:app.fs*0.2;bc:'red'}
                }
                Text{
                    id:t8p2
                    width: app.fs*20
                    font.pixelSize: app.fs*0.5
                    color: app.c2
                    anchors.horizontalCenter: parent.horizontalCenter
                    wrapMode: Text.WordWrap
                    text:'Ya sobre el final de la segunda dècada del tercer milenio, los hechos han sorprendido incluso a los investigadores y cientìficos. El fenòmeno del Calentamiento Global no se han producido en su plenitud debido a la apariciòn de un nuevo fenòmeno medio ambiental. El Oscurecimiento Global.'
               Marco{visible:x8.mv===2;id:mmt3;padding:app.fs*0.2;bc:'red'}
                }

                Row{
                    spacing: app.fs
                    Text{
                        id:t8p3
                        width: app.fs*10
                        font.pixelSize: app.fs*0.5
                        color: app.c2
                        wrapMode: Text.WordWrap
                        text:'Este nuevo fenòmeno climatològico, en un comienzo se ha considerado un hecho que frenarìa los daños provocados por el calentamiento global. Si bien esto es cierto, lamentablemente, a pesar de haber servido para detener el calentamiento global, ha traìdo consigo desastres naturales de igual o mayor proporciòn que el calentamiento global.'
                    Marco{visible:x8.mv===3;id:mmt4;padding:app.fs*0.2;bc:'red'}
                    }
                    Image{
                        width: app.fs*6
                        source: 'f1.jpg'
                        fillMode: Image.PreserveAspectFit
                        anchors.verticalCenter: parent.verticalCenter
                        Marco{visible:x8.mv===4;id:mmt5;padding:app.fs*0.2;bc:'red'}
                    }
                }
                Item{height: app.fs}
                Text{
                   font.pixelSize: app.fs*0.3
                    color: app.c2
                    anchors.horizontalCenter: parent.horizontalCenter
                    wrapMode: Text.WordWrap
                    text:'Fuente @nextsigner                Pàgina 1 de 87654'
                    Marco{visible:x8.mv===5;id:mmt6;padding:app.fs*0.2;bc:'red'}
                }

            }
        }
        property int mv: -1
        Timer{
            running: x8.opacity===1.0
            repeat: true
            interval: 1000
            onTriggered: {
                if(x8.mv<5){
                    x8.mv++
                }else{
                    x8.mv=0
                }
            }
        }
    }

    Component{
        id:item
        Rectangle{
            id:xItem
            border.width: 1
            border.color: app.c2
            color: 'transparent'
            property string t: 'Item'
            Rectangle{
                width: parent.width*0.35
                height: width
                radius: width*0.5
                color: 'red'
                border.width: app.fs*0.1
                border.color: app.c2
                anchors.centerIn: parent
                anchors.horizontalCenterOffset: app.fs*2
                Text {
                    text: 'Objeto de\nEjemplo '
                    font.pixelSize: app.fs*0.3
                    color: app.c2
                    anchors.centerIn: parent
                    horizontalAlignment: Text.AlignHCenter
                }
            }
            Rectangle{
                width: parent.width*0.25
                height: width
                radius: width*0.5
                color: 'blue'
                border.width: app.fs*0.1
                border.color: app.c2
                anchors.centerIn: parent
                anchors.horizontalCenterOffset: 0-app.fs
                Text {
                    text: 'Objeto de\nEjemplo '
                    font.pixelSize: app.fs*0.3
                    color: app.c2
                    anchors.centerIn: parent
                    horizontalAlignment: Text.AlignHCenter
                }
            }
            Timer{
                running: x3.opacity===1.0 || x5.opacity===1.0
                repeat: true
                interval: x3.opacity===1.0?1000:500
                property bool vi: true
                onTriggered: {
                    if(x3.opacity===1.0){
                        xItem.border.width=xItem.border.width===1?0:1
                    }else{
                        if(item3.demo===0){
                            vi=true
                            interval=500
                            if(item3.x<app.fs*3){
                                item3.x=app.fs*3
                            }else{
                                item3.x=app.fs
                            }
                            if(item3.y<app.fs*3){
                                item3.y=app.fs*3
                            }else{
                                item3.y=app.fs
                            }
                        }
                        if(item3.demo===1){
                            vi=true
                            interval=500
                            item3.x=app.fs
                            item3.y=app.fs
                            if(item3.width<app.fs*7){
                                item3.width=app.fs*7
                            }else{
                                item3.width=app.fs*5.5
                            }
                            if(item3.height<app.fs*5){
                                item3.height=app.fs*5
                            }else{
                                item3.height=app.fs*3.5
                            }
                        }
                        if(item3.demo===2){
                            vi=!vi
                            interval=1000
                            if(vi){
                                item3.visible=false
                            }else{
                                item3.visible=true
                            }
                        }
                    }

                }
            }
            Text {
                x:app.fs*0.1
                y:app.fs*0.1
                text: '     '+parent.parent.objectName+'<br>    x='+parseInt(parent.parent.x)+' y='+parseInt(parent.parent.y)+' <br>    ancho='+parseInt(parent.width)+' alto='+parseInt(parent.height)
                font.pixelSize: app.fs*0.3
                color: 'red'
                Rectangle{
                    width: parent.width+app.fs*0.1
                    height: parent.height+app.fs*0.1
                    z:parent.z-1
                    anchors.centerIn: parent
                    radius: app.fs*0.1
                }
            }
        }
    }

    Component{
        id:itemG
        Rectangle{
            id:xItemG
            border.width: vi?2:0
            border.color: app.c2
            color: 'transparent'
            property bool vi: true
            Rectangle{
                anchors.fill: parent
                opacity:xItemG.vi?1.0:0.5
                border.width: 2
                border.color: app.c2
                color: 'transparent'
            }
            Grid{
                id:g1
                anchors.centerIn: parent
                columns: 3
                spacing: app.fs*0.1
                Repeater{
                    model:['red', 'blue', 'brown', 'yellow', 'green','gray']
                    Rectangle{
                        width: app.fs*2
                        height: width
                        color: modelData
                        Text{
                            text:'Obj\n'+index
                            font.pixelSize: parent.width*0.25
                            anchors.centerIn: parent
                            horizontalAlignment: Text.AlignHCenter
                        }
                    }
                }
            }
            Item{
                id:mg1
                anchors.fill: g1
                opacity:!xItemG.vi?1.0:0.5
                Rectangle{
                    width: app.fs*0.5
                    height: app.fs*0.1
                    color:app.c2
                    anchors.left: parent.right
                    anchors.verticalCenter: parent.verticalCenter
                }
                Marco{
                    id:mmg1;
                    padding:app.fs*0.2
                    Text{
                        text:'CHILDREN\nArray de Objetos'
                        font.pixelSize: app.fs*0.5
                        color: app.c2
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.right
                        anchors.leftMargin: app.fs*0.5
                        Marco{padding:app.fs*0.1}
                    }
                }
            }
            Text{
                opacity:xItemG.vi?1.0:0.5
                text:'Item como Elemento MADRE\n o PARENT de todos los elementos internos'
                font.pixelSize: app.fs*0.5
                color: app.c2
                anchors.left: parent.left
                anchors.leftMargin: app.fs*0.5
                anchors.bottom: parent.top
                anchors.bottomMargin: app.fs*0.5
            }
            Rectangle{
                opacity:xItemG.vi?1.0:0.5
                width: 1
                height: app.fs
                anchors.top: parent.bottom
                color: app.c2
                Rectangle{
                    width: app.fs
                    height: 1
                    anchors.top: parent.bottom
                    color: app.c2
                    Text{
                        text:'Item no tiene bordes\nLo señalamos para que sepas su ubicaciòn y tamaño.'
                        font.pixelSize: app.fs*0.5
                        color: app.c2
                        anchors.left: parent.right
                        anchors.leftMargin: app.fs*0.5
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }

            }
            Timer{
                running: x6.opacity===1.0
                repeat: true
                interval: 3000
                onTriggered: {
                    xItemG.vi=!xItemG.vi
                }
            }
        }
    }



    Timer{
        running: r.visible
        repeat: true
        interval: 250
        onTriggered: {
            x1.opacity=app.p(0, 6)?1.0:0.0

            x2.opacity=app.p(6, 47)?1.0:0.0
            txt1.opacity=app.p(6, 9)?1.0:0.5
            mm1.opacity=app.p(10, 13)?1.0:0.0
            mm2.opacity=app.p(14, 47)?1.0:0.0
            if(app.p(21, 23)){
                txtVer.text='1.4'
            }else if(app.p(23, 25)){
                txtVer.text='2.0'
            }else if(app.p(25, 28)){
                txtVer.text='2.5'
            }else if(app.p(34, 38)){
                txtVer.text='2.9'
            }else if(app.p(38, 42)){
                txtVer.text='2.11'
            }else{
                txtVer.text='2.0'
            }

            x3.opacity=app.p(47, 56)?1.0:0.0
            x4.opacity=app.p(56, 71)?1.0:0.0
            if(app.p(57, 62)){
                mm100.opacity=1.0
                mm101.opacity=0.0
                mm102.opacity=0.0
                mm103.opacity=0.0
                mm104.opacity=0.0
            }else if(app.p(62, 64)){
                mm100.opacity=0.0
                mm101.opacity=1.0
                mm102.opacity=0.0
                mm103.opacity=0.0
                mm104.opacity=0.0
            }else if(app.p(64, 66)){
                mm100.opacity=0.0
                mm101.opacity=0.0
                mm102.opacity=1.0
                mm103.opacity=0.0
                mm104.opacity=0.0
            }else if(app.p(66, 68)){
                mm100.opacity=0.0
                mm101.opacity=0.0
                mm102.opacity=0.0
                mm103.opacity=1.0
                mm104.opacity=0.0
            }else if(app.p(68, 70)){
                mm100.opacity=0.0
                mm101.opacity=0.0
                mm102.opacity=0.0
                mm103.opacity=0.0
                mm104.opacity=1.0
            }else{
                mm100.opacity=0.0
                mm101.opacity=0.0
                mm102.opacity=0.0
                mm103.opacity=0.0
                mm104.opacity=0.0
            }

            x5.opacity=app.p(71, 250)?1.0:0.0
            if(app.p(71, 81)){
                mm200.opacity=1.0
                mm201.opacity=0.0
                mm202.opacity=0.0
                mm203.opacity=0.0
            }else if(app.p(81, 93)){
                mm200.opacity=0.0
                mm201.opacity=1.0
                mm202.opacity=0.0
                mm203.opacity=0.0
            }else if(app.p(106, 178)){
                mm200.opacity=0.0
                mm201.opacity=0.0
                mm202.opacity=1.0
                mm203.opacity=0.0
            }else if(app.p(178, 250)){
                mm200.opacity=0.0
                mm201.opacity=0.0
                mm202.opacity=0.0
                mm203.opacity=1.0
            }else{
                mm200.opacity=0.0
                mm201.opacity=0.0
                mm202.opacity=0.0
                mm203.opacity=0.0
            }
            if(app.p(71, 83)){
                item3.demo=0
            }else if(app.p(83, 95)){
                item3.demo=1
            }else if(app.p(106, 178)){
                item3.demo=2
            }else if(app.p(178, 186)){
                item3.visible=true
                item3.opacity=0.3
                item3.demo=-1
            }else if(app.p(220, 227)){
                item3.visible=true
                item3.demo=-1
                item3.opacity=0.5
            }else if(app.p(227, 255)){
                item3.visible=true
                item3.demo=-1
                item3.opacity=0.0
            }else{
                item3.visible=true
                item3.demo=-1
                item3.opacity=1.0
            }

            x6.opacity=app.p(250, 371)?1.0:0.0
            x7.opacity=app.p(371, 423)?1.0:0.0
            x8.opacity=app.p(423, 449)?1.0:0.0
        }
    }
    function e(n){
        var sp=''
        for(var i=0;i<n;i++){
            sp+='   '
        }
        return sp
    }
    Component.onCompleted: {
        controles.asec=[0, 6,47,56, 71, 250, 371, 423]
        var at=''
        at+=e(10)
        //Pr
        at+='Elemento Item'

        at+=e(20)
        at+='\n' //Req
        at+='Para utilizar este elemento es necesario importar la librerìa QtQuick. Podemos utilizar la versiones compatibles con unik y este curso tales como la versiòn 1.4, 2.0 hasta 2.5. Para unik recomendamos la versiòn 2.0. Si quieres puedes experimentar e importar versiones posteriores a las mencionadas pero no te podemos garantizar su funcionalidad. '

        at+=e(2)
        at+='\n' //Q
        at+='Item Es un elemento posicionador y contenedor'

        at+=e(2)
        at+='\n' //PP
        at+='Sus propiedades principales son ejes de posicionamiento x e y, ancho, alto, visible y opacidad'

        at+=e(20)
        at+='\n'//PN
        at+='Las propiedades X e Y se utilizan para definir la posiciòn del elemento. Las propiedes ancho y alto se utilizan para definir el tamaño, es decir las dimensiones del elemento. Tanto las propiedades de posiciòn y de dimensiòn, ambos requieren un valor del tipo nùmero entero.                                      La propiedad VISIBLE se utiliza para definir si el elemento es visible o no. Èsta propiedad requiere un valor del tipo booleano, TRUE o FALSE. '

        at+=e(20)
        at+='Si la propiedad es definida como verdadero, el elemento serà visible en tanto y en cuanto contenga elementos internos visibles. Si no contiene elementos serà visible pero no veremos nada en pantalla. Si èsta propiedad es definida con el valor false, el elemento no serà visible, tampoco sus elementos internos. Por defecto la propiedad VISIBLE es verdadero.                                                                           La propiedad de opacidad se utiliza para definir el nivel de transparencia del elemento. Esta propiedad requiere de un valor del tipo nùmero real cuyo valor màximo es 1.0 y el valor mìnimo es 0.0. Por ejemplo si el valor es 1.0 el elemento se visualizarà con plena opacidad y cero transparencia. Si el valor es 0.5 el elemento se visualizarà semi transparente. Si el valor es 0.0, el elemento tendrà un nivel de transparencia plena, esto provocarà que el elemento sea invisible en pantalla independientemente de cuàl sea su propiedad VISIBLE.'

        at+=e(20)
        at+='\n'//PQ
        at+='Este elemento nos permite crear un area invisible, sin bordes y con fondo transparente. Dentro de esta area podemos incluir otros elementos visibles o no visibles. Item, salvo raras excepciones, contendrà otros elementos en su interios. En la pràctica tiene poco sentido que este elemento Item no tenga elementos en su interior.

Al tener elementos en su interior, este elemento Item contenedor se lo denomina Objeto o Elemento Madre. Los Items o elementos internos se denominan hijos. Dependiendo del contexto, para referirnos a el elemento Madre podemos hacerlo mediante el su propiedad id o mediante el tèrmino PARENT. Para referirnos al conjunto de elementos hijos el tèrmino a utilizar es CHILDREN.

Los cambios en las propiedades del elemento Item contenedor afectaràn a sus elementos hijos.
'
        at+='\n'//Cu
        at+='Este elemento es muy ùtil para utilizar còmo contenedor de uno o varios elementos internos a los cuales los queremos controlar de manera conjunta.'

        at+='\n'//Ie
        at+='Este es el elemento principal de QML de cuàl dependen la mayorìa de los elementos los cuales estàn creados a partir de este elemento Item como base. Hay que recordar que la mayorìa de los elementos QML heredan propiedades y caracterìsticas del elemento Item porque derivan o fueron construidos con èl.

Conocer lo màximo posible este elemento Item, nos facilitarà muchìsimo la comprensiòn de casi la totalidad de los elementos de QML. Este elemento se llama Item porque es la palabra que se utiliza para hacer referencia a un artìculo, pàrrafo, apartado, secciòn, cosa, objeto o  parte de un texto o escrito por ejemplo en la literatura.'

        xT.at=at.replace(/\n/g, ' ')
    }
}
