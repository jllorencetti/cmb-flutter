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
    final pet = listPetTest[index];

    Widget _petImage = Image.network(
      pet.imageUrl,
      height: 100.0,
    );

    Widget _cardBody = Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            pet.name,
            style: Theme.of(context).textTheme.title,
          ),
          Text(
            pet.status,
          ),
          Text(
            'Araras - SP',
          ),
        ],
      ),
    );

    return Column(
      children: <Widget>[
        InkWell(
          onTap: () {},
          splashColor: Colors.lightGreen,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _petImage,
                _cardBody,
              ],
            ),
          ),
        ),
        Divider(),
      ],
    );
  }

  Widget petList = ListView.builder(
    itemCount: listPetTest.length,
    itemBuilder: _itemBuilder,
  );

  return Scaffold(
    appBar: AppBar(
      title: Text('Cadê meu Bicho'),
    ),
    body: RefreshIndicator(
      onRefresh: () async {},
      child: petList,
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
