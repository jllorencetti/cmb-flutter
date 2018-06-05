import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

Widget _homePage() {
  return Scaffold(
    appBar: AppBar(
      title: Text('Cadê meu Bicho'),
    ),
    body: Center(
      child: Text('New App'),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.green[900],
      ),
      home: _homePage(),
    );
  }
}
