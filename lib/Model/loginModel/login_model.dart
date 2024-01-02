class LoginModel {
  bool? success;
  int? status;
  String? message;
  String? name;
  String? userName;
  String? phoneNumber;
  String? image;
  bool? isVerified;
  String? role;
  String? authType;
  int? token;
  String? jwtToken;
  String? sId;

  LoginModel(
      {this.success,
        this.status,
        this.message,
        this.name,
        this.userName,
        this.phoneNumber,
        this.image,
        this.isVerified,
        this.role,
        this.authType,
        this.token,
        this.jwtToken,
        this.sId});

  LoginModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    message = json['message'];
    name = json['name'];
    userName = json['userName'];
    phoneNumber = json['phoneNumber'];
    image = json['image'];
    isVerified = json['isVerified'];
    role = json['role'];
    authType = json['authType'];
    token = json['token'];
    jwtToken = json['jwtToken'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['status'] = this.status;
    data['message'] = this.message;
    data['name'] = this.name;
    data['userName'] = this.userName;
    data['phoneNumber'] = this.phoneNumber;
    data['image'] = this.image;
    data['isVerified'] = this.isVerified;
    data['role'] = this.role;
    data['authType'] = this.authType;
    data['token'] = this.token;
    data['jwtToken'] = this.jwtToken;
    data['_id'] = this.sId;
    return data;
  }
}
