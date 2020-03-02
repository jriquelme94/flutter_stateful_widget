import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
      home: MyButton()
  ));
}

class MyButton extends StatefulWidget {
  @override
  // El método createState() es el encargado de crear el estado de nuesto Widget.
  _MyButtonState createState() => new _MyButtonState();
}

// La clase "_MyButtonState" extiende a la clase State para indicar que mi clase "MyButton" ser va a encargar de modificar el estado de la clase "_MyButtonState".
class _MyButtonState extends State<MyButton> {
  String mensaje = "";
  int indice = 0;
  // Creo una lista de String que servirá para mostarlos según la cantidad de veces que se haya tocado el botón.
  List<String> coleccion = ["Por favor, no lo hagas", "Creo que deberías parar", "No te das por vencido facil, no?", "Esta bien. Tu ganas! :D", "Ya ganaste ¿Qué esperabas? ¿Un premio?"];

  // Método "onPressButon" que se llamará cuando se pulse el botón.
  void onPressButon() {
    // La sentencia "setState" vuelve a renderizar mis Widget (acualiza estados).
    setState(() {
      mensaje = coleccion[indice];
      /* Creo una condicion en la cual, si la cantidad de veces que se haya pulsado el botón,
      es menor a la cantidad de elementos en mi lista, aumente la variable "indice" en 1. */
      indice = indice < 4 ? indice + 1 : 0;
    });
  }

  @override
  // Ahora creamos un Widget que va a ser el que se vuelva a renderizar (cambiar su estado) cuando se pulse el botón.
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        appBar: new AppBar(
            title: new Text("App Stateful Widget"),
            backgroundColor: Colors.orange
        ),
        body: new Container(
          child: new Center(
            child: new Column(
              // Sentencia para poder alinear los elementos de mi Widget en el centro de la pantalla.
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(
                  mensaje,
                  style: new TextStyle(fontSize: 20.00),),

                new Padding(padding: new EdgeInsets.all(10.00)),

                new RaisedButton(
                  child: new Text("No tocar!", style: new TextStyle(color: Colors.white),),
                  color: Colors.blueGrey,
                  // onPressed sirve para poder llamar funciones o metodos al pulsar el botón.
                  onPressed: onPressButon,
                )
              ],
            ),
          ),
        )
    );
  }
}