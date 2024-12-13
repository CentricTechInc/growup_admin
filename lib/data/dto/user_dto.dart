enum Roles { Admin, subAdmin }

class UserModelDto {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? picture;
  Roles? role;
  String? token;

  UserModelDto(
      {this.id,
      this.name,
      this.email,
      this.phone,
      this.picture,
      this.role,
      this.token});

  UserModelDto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    picture = json['picture'];
    role = Roles.values.byName(json['role']);
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['picture'] = picture;
    data['role'] = role?.name;
    data['token'] = token;
    return data;
  }
}
