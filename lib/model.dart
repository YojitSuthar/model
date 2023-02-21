class namesModel {
  String? name;
  String? age;
  String? address;

  namesModel({this.name, this.age, this.address});

  namesModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    age = json['age'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['age'] = this.age;
    data['address'] = this.address;
    return data;
  }



}