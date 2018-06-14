import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'models.dart';

void main() => runApp(MyApp());

Widget _homePage() {
  return Scaffold(
    appBar: AppBar(
      title: Text('Cadê meu Bicho'),
    ),
    body: PetList(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.green[900],
        accentColor: Colors.green[900],
      ),
      home: _homePage(),
    );
  }
}

class PetListItem extends StatelessWidget {
  final Pet pet;

  const PetListItem({Key key, this.pet}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _petImage = CachedNetworkImage(
      placeholder: SizedBox(
        child: CircularProgressIndicator(),
        height: 100.0,
        width: 100.0,
      ),
      imageUrl: pet.thumbPicUrl,
      width: 100.0,
      height: 100.0,
      fit: BoxFit.cover,
    );

    Widget _cardBody = Flexible(
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              pet.name,
              style: Theme.of(context).textTheme.title,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              pet.status,
            ),
            Text(
              pet.city,
            ),
          ],
        ),
      ),
    );

    return Card(
      child: InkWell(
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
    );
  }
}

class PetList extends StatefulWidget {
  @override
  _PetListState createState() => _PetListState();
}

class _PetListState extends State<PetList> {
  // Placeholder data
  var listPetTest = List<Pet>.generate(20, (int index) {
    return Pet(
      name: 'Testing Pet ${index + 1}',
      description:
          "Eat owner's food, chase tail sit and stare, sleep everywhere.",
      profilePicUrl: 'https://placekitten.com/100/100',
      thumbPicUrl: 'https://placekitten.com/100/100',
      status: 'Adopted',
      city: 'Araras',
    );
  });

  Widget _itemBuilder(BuildContext context, int index) {
    return PetListItem(pet: listPetTest[index]);
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        final response = await http.get('https://cademeubicho.com/api/pets/');
        final responseJson =
            json.decode(Utf8Decoder().convert(response.bodyBytes));
        final pets = responseJson['results'];

        var newList = <Pet>[];
        for (var petData in pets) {
          newList.add(Pet.fromJson(petData));
        }

        setState(() {
          listPetTest = newList;
        });
      },
      child: ListView.builder(
        itemCount: listPetTest.length,
        itemBuilder: _itemBuilder,
      ),
    );
  }
}
