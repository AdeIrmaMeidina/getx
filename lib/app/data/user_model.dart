class User {
  bool? success;
  String? message;
  List<DataUser>? data;

  User({this.success, this.message, this.data});

  User.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <DataUser>[];
      json['data'].forEach((v) {
        data!.add(new DataUser.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
    
  }
}

class DataUser {
  int? id;
  String? name;
  String? email;
  Null? emailVerifiedAt;
  String? password;
  String? createdAt;
  String? updatedAt;

  DataUser(
      {this.id,
      this.name,
      this.email,
      this.emailVerifiedAt,
      this.password,
      this.createdAt,
      this.updatedAt});

  DataUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];  // Default to an empty string if null
    email = json['email'];  // Default to an empty string if null
    emailVerifiedAt = json['email_verified_at'];
    password = json['password'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  get namaUser => null;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['password'] = this.password;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
