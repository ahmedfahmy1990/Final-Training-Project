class ResponseRegister {
  String? _token;

  String? get token => _token;

  ResponseRegister({
    String? token}){
    _token = token;
  }

  ResponseRegister.fromJson(dynamic json) {
    _token = json["token"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["token"] = _token;
    return map;
  }

}