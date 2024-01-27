class GoogleAuthModel {
  String? token;
  User? user;

  GoogleAuthModel({this.token, this.user});

  GoogleAuthModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  String? sId;
  String? name;
  String? userName;
  String? phoneNumber;
  String? email;
  String? image;
  bool? isVerified;
  int? token;
  String? role;
  String? authType;
  int? iV;
  int? otp;
  bool? isOtpValid;

  User(
      {this.sId,
        this.name,
        this.userName,
        this.phoneNumber,
        this.email,
        this.image,
        this.isVerified,
        this.token,
        this.role,
        this.authType,
        this.iV,
        this.otp,
        this.isOtpValid});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    userName = json['userName'];
    phoneNumber = json['phoneNumber'];
    email = json['email'];
    image = json['image'];
    isVerified = json['isVerified'];
    token = json['token'];
    role = json['role'];
    authType = json['authType'];
    iV = json['__v'];
    otp = json['otp'];
    isOtpValid = json['isOtpValid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['userName'] = this.userName;
    data['phoneNumber'] = this.phoneNumber;
    data['email'] = this.email;
    data['image'] = this.image;
    data['isVerified'] = this.isVerified;
    data['token'] = this.token;
    data['role'] = this.role;
    data['authType'] = this.authType;
    data['__v'] = this.iV;
    data['otp'] = this.otp;
    data['isOtpValid'] = this.isOtpValid;
    return data;
  }
}
