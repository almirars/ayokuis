import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'input.dart';
import 'convert.dart';
import 'result.dart';
import 'history.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController satuan = new TextEditingController();

  var listItem = ["Kg", "Hg", "Dag", "G", "Dg", "Cg", "Mg"];
  final inputController = TextEditingController();
  List<String> listViewItem = List<String>();
  String _newValue = "Kg";
  String _newValue1 = "Kg";
  double _result = 0;
  double _inputSatuan = 0;

  void hitung() {
    setState(() {
      _inputSatuan = double.parse(satuan.text);
      if (_newValue == "Kg") {
        if (_newValue1 == "Hg")
          _result = _inputSatuan * 10;
        else if (_newValue1 == "Dag")
          _result = _inputSatuan * 100;
        else if (_newValue1 == "G")
          _result = _inputSatuan * 1000;
        else if (_newValue1 == "Dg")
          _result = _inputSatuan * 10000;
        else if (_newValue1 == "Cg")
          _result = _inputSatuan * 100000;
        else if (_newValue1 == "Mg") _result = _inputSatuan * 1000000;
      } else if (_newValue == "Hg") {
        if (_newValue1 == "Kg")
          _result = _inputSatuan / 10;
        else if (_newValue1 == "Dag")
          _result = _inputSatuan * 10;
        else if (_newValue1 == "G")
          _result = _inputSatuan * 100;
        else if (_newValue1 == "Dg")
          _result = _inputSatuan * 1000;
        else if (_newValue1 == "Cg")
          _result = _inputSatuan * 10000;
        else if (_newValue1 == "Mg") _result = _inputSatuan * 100000;
      } else if (_newValue == "Dag") {
        if (_newValue1 == "Kg")
          _result = _inputSatuan / 100;
        else if (_newValue1 == "Hg")
          _result = _inputSatuan / 10;
        else if (_newValue1 == "G")
          _result = _inputSatuan * 10;
        else if (_newValue1 == "Dg")
          _result = _inputSatuan * 100;
        else if (_newValue1 == "Cg")
          _result = _inputSatuan * 1000;
        else if (_newValue1 == "Mg") _result = _inputSatuan * 10000;
      } else if (_newValue == "G") {
        if (_newValue1 == "Kg")
          _result = _inputSatuan / 1000;
        else if (_newValue1 == "Hg")
          _result = _inputSatuan / 100;
        else if (_newValue1 == "Dag")
          _result = _inputSatuan / 10;
        else if (_newValue1 == "Dg")
          _result = _inputSatuan * 10;
        else if (_newValue1 == "Cg")
          _result = _inputSatuan * 100;
        else if (_newValue1 == "Mg") _result = _inputSatuan * 1000;
      } else if (_newValue == "Dg") {
        if (_newValue1 == "Kg")
          _result = _inputSatuan / 10000;
        else if (_newValue1 == "Hg")
          _result = _inputSatuan / 1000;
        else if (_newValue1 == "Dag")
          _result = _inputSatuan / 100;
        else if (_newValue1 == "G")
          _result = _inputSatuan / 10;
        else if (_newValue1 == "Cg")
          _result = _inputSatuan * 10;
        else if (_newValue1 == "Mg") _result = _inputSatuan * 100;
      } else if (_newValue == "Cg") {
        if (_newValue1 == "Kg")
          _result = _inputSatuan / 100000;
        else if (_newValue1 == "Hg")
          _result = _inputSatuan / 10000;
        else if (_newValue1 == "Dag")
          _result = _inputSatuan / 1000;
        else if (_newValue1 == "G")
          _result = _inputSatuan / 100;
        else if (_newValue1 == "Dg")
          _result = _inputSatuan / 10;
        else if (_newValue1 == "Mg") _result = _inputSatuan * 10;
      } else if (_newValue == "Mg") {
        if (_newValue1 == "Kg")
          _result = _inputSatuan / 1000000;
        else if (_newValue1 == "Hg")
          _result = _inputSatuan / 100000;
        else if (_newValue1 == "Dag")
          _result = _inputSatuan / 10000;
        else if (_newValue1 == "G")
          _result = _inputSatuan / 1000;
        else if (_newValue1 == "Dg")
          _result = _inputSatuan / 100;
        else if (_newValue1 == "Cg") _result = _inputSatuan / 10;
      }

      listViewItem.add(_newValue + ": " + _result.toString() + _newValue1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Konversi Satuan',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Konverter Satuan"),
        ),
        body: Container(
          margin: EdgeInsets.all(8),
          child: Column(
            children: <Widget>[
              Input(satuan: satuan),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    "Dari ",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  DropdownButton<String>(
                    items: listItem.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    value: _newValue,
                    onChanged: (String changeValue) {
                      setState(() {
                        _newValue = changeValue;
                      });
                    },
                  ),
                  Text("Ke ",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  DropdownButton<String>(
                    items: listItem.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    value: _newValue1,
                    onChanged: (String changeValue) {
                      setState(() {
                        _newValue1 = changeValue;
                      });
                    },
                  ),
                ],
              ),
              Result(result: _result),
              Convert(convertHandler: hitung),
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child: Text(
                  "Riwayat Konversi",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              history(listViewItem: listViewItem),
            ],
          ),
        ),
      ),
    );
  }
}
