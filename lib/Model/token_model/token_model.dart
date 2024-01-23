class TokenModel {
  bool? success;
  String? message;
  User? user;

  TokenModel({this.success, this.message, this.user});

  TokenModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  String? sId;
  int? token;

  User({this.sId, this.token});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['token'] = this.token;
    return data;
  }
}
