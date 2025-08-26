import 'package:flutter/material.dart';
import 'package:flutter_superheroes/data/model/superheroe_detail_response.dart';
import 'package:flutter_superheroes/data/model/superheroe_response.dart';
import 'package:flutter_superheroes/data/repository.dart';

class SuperheroSearchScreen extends StatefulWidget {
  const SuperheroSearchScreen({super.key});

  @override
  State<SuperheroSearchScreen> createState() => _SuperheroSearchScreenState();
}

class _SuperheroSearchScreenState extends State<SuperheroSearchScreen> {
  Future<SuperheroeResponse?>? _superheroInfo;
  Repository repository = Repository();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Superhero Search")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Busca un superhéroe",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (text) {
                setState(() {
                  _superheroInfo = repository.fetchSuperheroInfo(text);
                });
              },
            ),
          ),
          bodyList(),
        ],
      ),
    );
  }

  FutureBuilder<SuperheroeResponse?> bodyList() {
    return FutureBuilder(
          future: _superheroInfo,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text("Error: ${snapshot.error}");
            } else if (snapshot.hasData) {
              var superheroList = snapshot.data?.result;
              return Expanded(                  
                child: ListView.builder(
                  itemCount: superheroList?.length ?? 0,
                  itemBuilder: (context, index) {
                    if (superheroList != null) {
                      return itemSuperhero(superheroList[index]);
                    } else {
                      return Text("Error");
                    }
                  },
                ),
              );
            } else {
              return Text("No hay resultados");
            }
          },
        );
  }

  Column itemSuperhero(SuperheroeDetailResponse item) => Column(
    children: [
      Image.network(item.url, height: 250, width: double.infinity, fit: BoxFit.cover, alignment: Alignment.center),
      Text(item.name)
    ],
  );
}
