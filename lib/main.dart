import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: const Text('Калькулятор площади')),
          body: const MyApp(),
        ),
      ),
    );

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  final _formKey = GlobalKey<FormState>();

  int? _area;
  int _height = 0;
  int _width = 0;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(children: [
        Row(children: <Widget>[
          Container(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
              child: const Text('Ширина (мм):')),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              child: TextFormField(validator: (value) {
                if (value!.isEmpty) return 'Задайте Ширину';
                try {
                  _width = int.parse(value);
                } catch (e) {
                  _width = 0;
                  return e.toString();
                }
              }),
            ),
          ),
        ]),
        const SizedBox(height: 10),
        Row(children: <Widget>[
          Container(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
              child: const Text('Высота (мм):')),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              child: TextFormField(validator: (value) {
                if (value!.isEmpty) return 'Задайте Высоту';
                try {
                  _height = int.parse(value);
                } catch (e) {
                  _height = 0;
                  return e.toString();
                }
              }),
            ),
          ),
        ]),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              setState(() {
                _area = _width * _height;
              });
            }
          },
          child: const Text('Вычислить'),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue)),
        ),
        const SizedBox(height: 10),
        Text(
          _area == null
              ? 'задайте параметры'
              : 'S = $_width * $_height = $_area (мм2)',
          style: const TextStyle(fontSize: 25),
        )
      ]),
    );
  }
}
