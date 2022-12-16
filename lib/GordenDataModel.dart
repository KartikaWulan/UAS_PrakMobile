class GordenDataModel {
  int? id;
  String? name;
  String? price;
  String? description;
  String? Image;

  GordenDataModel(
      {this.id, this.name, this.price, this.description, this.Image});

  GordenDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    description = json['description'];
    Image = json['Image'];
  }
}
