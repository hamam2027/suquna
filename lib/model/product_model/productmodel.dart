class ProductModel {
  int? id;
  String? image;
  String? name;
  String? description;
  String? price;
  bool? wishlistedByUser;
  int? status;
  Category? category;
  User? user;
  String? createdAt;

  ProductModel(
      {this.id,
      this.image,
      this.name,
      this.description,
      this.price,
      this.wishlistedByUser,
      this.status,
      this.category,
      this.user,
      this.createdAt});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    wishlistedByUser = json['wishlisted_by_user'];
    status = json['status'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;
    data['wishlisted_by_user'] = this.wishlistedByUser;
    data['status'] = this.status;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['created_at'] = this.createdAt;
    return data;
  }
}

class Category {
  int? id;
  String? name;
  String? description;
  String? image;

  Category({this.id, this.name, this.description, this.image});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['image'] = this.image;
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
  String? address;
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
      this.address,
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
    address = json['address'];
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
    data['address'] = this.address;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['created_at'] = this.createdAt;
    return data;
  }
}
