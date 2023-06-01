class AddModel {
  int? id;
  String? title;
  double? price;
  String? cookies;

  AddModel({this.id, this.title, this.price, this.cookies});

  AddModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    cookies = json['cookies'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['price'] = price;
    data['cookies'] = cookies;

    return data;
  }
}
