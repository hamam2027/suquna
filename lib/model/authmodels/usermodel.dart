class UserModel {
  User? user;
  String? accessToken;

  UserModel({this.user, this.accessToken});

  UserModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    accessToken = json['access_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['access_token'] = this.accessToken;
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? phone;
  int? gender;
  String? dob;
  String? avatar;
  String? emailVerifiedAt;
  String? createdAt;

  User(
      {this.id,
      this.name,
      this.email,
      this.phone,
      this.gender,
      this.dob,
      this.avatar,
      this.emailVerifiedAt,
      this.createdAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    gender = json['gender'];
    dob = json['dob'];
    avatar = json['avatar'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['gender'] = this.gender;
    data['dob'] = this.dob;
    data['avatar'] = this.avatar;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['created_at'] = this.createdAt;
    return data;
  }
}
