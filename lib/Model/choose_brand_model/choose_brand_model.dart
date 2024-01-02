class ChooseBrandModel {
  String? message;
  bool? success;
  List<Brand>? brand;

  ChooseBrandModel({this.message, this.success, this.brand});

  ChooseBrandModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    success = json['success'];
    if (json['brand'] != null) {
      brand = <Brand>[];
      json['brand'].forEach((v) {
        brand!.add(new Brand.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['success'] = this.success;
    if (this.brand != null) {
      data['brand'] = this.brand!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Brand {
  String? sId;
  String? name;
  String? tag;
  String? logo;
  int? iV;

  Brand({this.sId, this.name, this.tag, this.logo, this.iV});

  Brand.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    tag = json['tag'];
    logo = json['logo'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['tag'] = this.tag;
    data['logo'] = this.logo;
    data['__v'] = this.iV;
    return data;
  }
}
