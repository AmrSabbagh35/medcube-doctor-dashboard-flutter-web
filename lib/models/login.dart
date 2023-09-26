class LoginData {
  int? id;
  String? username;
  String? phoneNumber;
  String? location;
  Null? attachFile;
  String? status;
  int? neighbohoodId;
  int? userTypeId;
  String? accountVerifiedAt;
  String? createdAt;
  String? updatedAt;
  String? token;

  LoginData(
      {this.id,
      this.username,
      this.phoneNumber,
      this.location,
      this.attachFile,
      this.status,
      this.neighbohoodId,
      this.userTypeId,
      this.accountVerifiedAt,
      this.createdAt,
      this.updatedAt,
      this.token});

  LoginData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    phoneNumber = json['phone_number'];
    location = json['location'];
    attachFile = json['attachFile'];
    status = json['status'];
    neighbohoodId = json['neighbohood_id'];
    userTypeId = json['user_type_id'];
    accountVerifiedAt = json['account_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['phone_number'] = this.phoneNumber;
    data['location'] = this.location;
    data['attachFile'] = this.attachFile;
    data['status'] = this.status;
    data['neighbohood_id'] = this.neighbohoodId;
    data['user_type_id'] = this.userTypeId;
    data['account_verified_at'] = this.accountVerifiedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['token'] = this.token;
    return data;
  }
}