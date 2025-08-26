class SuperheroeDetailResponse {
  final String id;
  final String name;
  final String url;

  SuperheroeDetailResponse({
    required this.id,
    required this.name,
    required this.url,
  });

  factory SuperheroeDetailResponse.fromJson(Map<String, dynamic> json) {
    return SuperheroeDetailResponse(id: json["id"], name: json["name"], url: json["image"]["url"]);
  }
}
