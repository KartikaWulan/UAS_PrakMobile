class GordenDataModel {
  int? id;
  String? name;
  String? price;
  String? description;
  String? ImageURL;

  GordenDataModel(
      {this.id, this.name, this.price, this.description, this.ImageURL});

  GordenDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    description = json['description'];
    ImageURL = json['ImageUrl'];
  }
}
