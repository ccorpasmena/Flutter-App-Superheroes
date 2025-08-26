class SuperheroeResponse {
  final String response;

  SuperheroeResponse({required this.response});

  factory SuperheroeResponse.fromJson(Map<String, dynamic> json) {
    return SuperheroeResponse(response: json["response"]);
  }
}
