class CheckResultModel {
  List<Order>? order;

  CheckResultModel({this.order});

  CheckResultModel.fromJson(Map<String, dynamic> json) {
    if (json['order'] != null) {
      order = <Order>[];
      json['order'].forEach((v) {
        order!.add(new Order.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.order != null) {
      data['order'] = this.order!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Order {
  String? sId;
  String? user;
  Product? product;
  String? status;
  String? productStatus;
  bool? responded;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Order(
      {this.sId,
        this.user,
        this.product,
        this.status,
        this.productStatus,
        this.responded,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Order.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    user = json['user'];
    product =
    json['product'] != null ? new Product.fromJson(json['product']) : null;
    status = json['status'];
    productStatus = json['productStatus'];
    responded = json['responded'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['user'] = this.user;
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    data['status'] = this.status;
    data['productStatus'] = this.productStatus;
    data['responded'] = this.responded;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class Product {
  String? sId;
  String? name;
  String? brandId;
  String? note;
  String? slug;
  String? appearance;
  String? frontside;
  String? backside;
  String? inside;
  String? priceTag;
  String? sideTag;
  String? receipt;
  String? additional;
  String? category;
  String? createdBy;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Product(
      {this.sId,
        this.name,
        this.brandId,
        this.note,
        this.slug,
        this.appearance,
        this.frontside,
        this.backside,
        this.inside,
        this.priceTag,
        this.sideTag,
        this.receipt,
        this.additional,
        this.category,
        this.createdBy,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Product.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    brandId = json['brandId'];
    note = json['note'];
    slug = json['slug'];
    appearance = json['appearance'];
    frontside = json['frontside'];
    backside = json['backside'];
    inside = json['inside'];
    priceTag = json['priceTag'];
    sideTag = json['sideTag'];
    receipt = json['receipt'];
    additional = json['additional'];
    category = json['category'];
    createdBy = json['createdBy'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['brandId'] = this.brandId;
    data['note'] = this.note;
    data['slug'] = this.slug;
    data['appearance'] = this.appearance;
    data['frontside'] = this.frontside;
    data['backside'] = this.backside;
    data['inside'] = this.inside;
    data['priceTag'] = this.priceTag;
    data['sideTag'] = this.sideTag;
    data['receipt'] = this.receipt;
    data['additional'] = this.additional;
    data['category'] = this.category;
    data['createdBy'] = this.createdBy;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
