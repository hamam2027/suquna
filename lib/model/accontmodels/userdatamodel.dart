class ProfileUserData {
  int? id;
  String? name;
  String? email;
  String? phone;
  int? gender;
  String? dob;
  String? avatar;
  String? emailVerifiedAt;
  String? createdAt;

  ProfileUserData(
      {this.id,
      this.name,
      this.email,
      this.phone,
      this.gender,
      this.dob,
      this.avatar,
      this.emailVerifiedAt,
      this.createdAt});

  ProfileUserData.fromJson(Map<String, dynamic> json) {
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
