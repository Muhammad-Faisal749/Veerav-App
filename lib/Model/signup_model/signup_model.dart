class SignUpModel {
  bool? success;
  int? status;
  String? type;
  String? message;

  SignUpModel({this.success, this.status, this.type, this.message});

  SignUpModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    type = json['type'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['status'] = this.status;
    data['type'] = this.type;
    data['message'] = this.message;
    return data;
  }
}
