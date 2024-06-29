import 'dart:io';

class Addprodactmodel {
  String? name;
  String? description;
  String? price;
  String? category_id;
  File? image;

  Addprodactmodel({
    this.name,
    this.description,
    this.price,
    this.category_id,
    this.image,
  });
  Addprodactmodel.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    price = json["price"];
    description = json["description"];
    category_id = json["category_id"];
    image = json["image"];
  }
  Map<String, dynamic> tojson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["name"] = this.name;
    data["price"] = this.price;
    data["description"] = this.description;
    data["category_id"] = this.category_id;
    data["image"] = this.image;

    return data;
  }
}
