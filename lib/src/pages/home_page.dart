import 'package:calculator/src/models/conversion.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _valor;
  String _moneda = '';
  double _conversion = 0.0;
  double _temp;
  List<String> _historial = [];

  //instancia de la clase para las conversiones
  Conversion _convertidor = new Conversion();

  // Para hacer responsibe la app
  Size _s;
  @override
  Widget build(BuildContext context) {
    _s = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Jennyfer Fuentes"),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text('Conversor de moneda'),
        // TextFormField(
        //   decoration: InputDecoration(prefixText: 'Valor'),
        // )
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Valor'),
            Container(
              width: _s.width * 0.6,
              child: TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    _valor = value;
                    try {
                      _temp = double.parse(_valor);
                    } catch (e) {}
                  });
                },
              ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FlatButton(
              color: _moneda != 'USD' ? Colors.black12 : Colors.blueAccent[100],
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10.0)),
              child: Text(' USD '),
              onPressed: () {
                setState(() {
                  _moneda = 'USD';
                  _conversion = _convertidor.pesosDolar(_temp);
                  _historial.add('$_valor    $_moneda   $_conversion');
                });
              },
            ),
            FlatButton(
              color:
                  _moneda != 'EUROS' ? Colors.black12 : Colors.blueAccent[100],
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10.0)),
              child: Text('EUROS'),
              onPressed: () {
                setState(() {
                  _moneda = 'EUROS';
                  _conversion = _convertidor.pesosEuro(_temp);
                  _historial.add('$_valor    $_moneda   $_conversion');
                });
              },
            ),
            FlatButton(
              color:
                  _moneda != 'YENES' ? Colors.black12 : Colors.blueAccent[100],
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10.0)),
              child: Text('YENES'),
              onPressed: () {
                setState(() {
                  _moneda = 'YENES';
                  _conversion = _convertidor.pesosYen(_temp);
                  _historial.add('$_valor    $_moneda   $_conversion');
                });
              },
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Moneda : $_moneda'),
            Text('Equivalencia : $_conversion')
          ],
        ),
        Container(
            color: Colors.black12,
            height: _s.height * 0.4,
            width: _s.width * 0.9,
            child: _historial.length == 0
                ? Container()
                : ListView.builder(
                    itemBuilder: (BuildContext context, int i) {
                      return Text(_historial[i]);
                    },
                    itemCount: _historial.length,
                  ))
      ],
    );
  }
}
