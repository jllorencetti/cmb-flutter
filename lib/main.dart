import 'package:flutter/material.dart';
import 'models.dart';

void main() => runApp(new MyApp());

// Placeholder data
final listPetTest = List<Pet>.generate(20, (int index) {
  return Pet(
    name: 'Testing Pet ${index + 1}',
    description:
        "Eat owner's food need to chase tail sit and stare, sleep everywhere, but not in my bed or slap owner's face at 5am until human fills food dish. Stare at the wall, play with food and get confused by dust while happily ignoring when being called.",
    imageUrl: 'https://placekitten.com/350/350',
    status: 'Adopted',
  );
});

Widget _homePage() {
  Widget _itemBuilder(BuildContext context, int index) {
    return Container(
      padding: EdgeInsets.only(left: 10.0),
      alignment: Alignment.centerLeft,
      child: Text(
        listPetTest[index].name,
        style: Theme.of(context).textTheme.headline,
      ),
    );
  }

  Widget petList = ListView.builder(
    itemCount: listPetTest.length,
    itemExtent: 60.0,
    itemBuilder: _itemBuilder,
  );

  return Scaffold(
    appBar: AppBar(
      title: Text('Cadê meu Bicho'),
    ),
    body: petList,
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
