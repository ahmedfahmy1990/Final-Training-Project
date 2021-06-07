/// categories : [{"id":1,"name":"Fashion","avatar":"https://retail.amit-learning.com/images/categories/l7KggHVGDdgqcpe8dIrmvKAzKSL12smtEt0nMDJq.jpg"},{"id":2,"name":"Electronics","avatar":"https://retail.amit-learning.com/images/categories/0dFQMWgiSbwa6Z4pcWw24DkV4Fw5TzJIRuosZz0e.jpg"},{"id":3,"name":"Baby Products","avatar":"https://retail.amit-learning.com/images/categories/ilJxwK6vIPBdflb3EmLHc5DiA7p2apdljYdxHqGo.jpg"},{"id":4,"name":"Health & Beauty","avatar":"https://retail.amit-learning.com/images/categories/fJtyicjsNSBhlex1gqT8DgCdsaUodPeAVOkqzc5V.jpg"},{"id":5,"name":"Phones","avatar":"https://retail.amit-learning.com/images/categories/RXUCTZCKFPgdvycsrfQl59f66CQwfJyvu7zIfd72.jpg"},{"id":6,"name":"Supermarket","avatar":"https://retail.amit-learning.com/images/categories/QKSTMJ9w2lrPvwGjAWmebJL00cMawjOTTbpmFRle.jpg"}]


class Categories {
  int? _id;
  String? _name;
  String? _avatar;

  int? get id => _id;
  String? get name => _name;
  String? get avatar => _avatar;

  Categories({
    int? id,
    String? name,
    String? avatar}){
    _id = id;
    _name = name;
    _avatar = avatar;
  }

  Categories.fromJson(dynamic json) {
    _id = json["id"];
    _name = json["name"];
    _avatar = json["avatar"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["name"] = _name;
    map["avatar"] = _avatar;
    return map;
  }

}

class Categories1 {
  List<Categories>? _categories;

  List<Categories>? get categories => _categories;

  Categories1({
      List<Categories>? categories}){
    _categories = categories;
}

  Categories1.fromJson(dynamic json) {
    if (json["categories"] != null) {
      _categories = [];
      json["categories"].forEach((v) {
        _categories?.add(Categories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_categories != null) {
      map["categories"] = _categories?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// name : "Fashion"
/// avatar : "https://retail.amit-learning.com/images/categories/l7KggHVGDdgqcpe8dIrmvKAzKSL12smtEt0nMDJq.jpg"



