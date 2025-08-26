import 'package:flutter_superheroes/data/model/superheroe_detail_response.dart';

class SuperheroeResponse {
  final String response;
  final List<SuperheroeDetailResponse> result;

  SuperheroeResponse({required this.response, required this.result});

  factory SuperheroeResponse.fromJson(Map<String, dynamic> json) {
    var list = json["results"] as List;
    List<SuperheroeDetailResponse> herolist = list
        .map((hero) => SuperheroeDetailResponse.fromJson(hero))
        .toList();
    return SuperheroeResponse(response: json["response"], result: herolist);
  }
}
