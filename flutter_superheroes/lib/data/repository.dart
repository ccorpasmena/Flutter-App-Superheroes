/* Aquí tenemos un método que recupera el JSON de la web, lo convierte en un
modelo de datos y lo devolvemos a la screen de superhero_search y lo 
pintamos en una lista */

import 'dart:convert';

import 'package:flutter_superheroes/data/model/superheroe_response.dart';
import 'package:http/http.dart' as http;

class Repository {
  Future<SuperheroeResponse?> fetchSuperheroInfo(String name) async {
    final response = await http.get(
      Uri.parse(
        "https://superheroapi.com/api/9bcab3a33f1722943a7d8fd9a90ce654/search/$name",
      ),
    );

    if (response.statusCode == 200) {
      var decodedJson = jsonDecode(response.body);
      SuperheroeResponse superheroeResponse = SuperheroeResponse.fromJson(
        decodedJson,
      );
      return superheroeResponse;
    } else {
      return null;
    }
  }
}
