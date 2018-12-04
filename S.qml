import QtQuick 2.0
import  "../../../"
Item {
    id: r
    width: app.an
    height: app.al-app.fs*2
    property int a: -1
    property int cantA: 3

    Xa0{id:xa0;visible: r.a===0}
    Xa1{id:xa1;visible: r.a===1}

    Timer{
        running: r.visible
        repeat: true
        interval: 250
        onTriggered: {
            //x1.opacity=app.p(0, 6)?1.0:0.0
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
        r.a=0
        //xa0.b1.focus=true
        /*controles.asec=[0, 6,47,56, 71, 250, 371, 423]
        var at=''
        at+=e(10)
        //Pr
        at+='Iniciar Base de Datos Sqlite'

        at+=e(20)
        at+='\n'
        at+='Para que nuestra aplicaciòn se conecte a una base de datos, es necesario crear un archivo del tipo .sqlite. Esto lo podemos hacer desde Qml utilizando el mètodo de unik llamado sqlInit().'
        xT.at=at.replace(/\n/g, ' ')*/
    }
}
