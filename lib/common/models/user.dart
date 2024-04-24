class LoginRequestEntity {
  int? type;
  String? name;
  String? descriptions;
  String? email;
  String? phone;
  String? avatar;
  String? open_id;
  int? online;

  LoginRequestEntity(
      {this.type,
      this.name,
      this.descriptions,
      this.email,
      this.phone,
      this.avatar,
      this.open_id,
      this.online});

  Map<String, dynamic> toJson() => {
        "type": type,
        "name": name,
        "description": descriptions,
        "email": email,
        "phone": phone,
        "avatar": avatar,
        "open_id": open_id,
        "online": online
      };
}
class UserLoginReponsEntity {
  int? code;
  String? msg;
  UserProfile? data;

  UserLoginReponsEntity({this.code, this.msg, this.data});

  factory UserLoginReponsEntity.fromJson(Map<String, dynamic> json) =>
      UserLoginReponsEntity(
        code: json["code"],
        msg: json["msg"],
        data: UserProfile.fromJson(json["data"]),
      );
}

class UserProfile {
  String? access_token;
  String? token;
  String? name;
  String? description;
  String? avatar;
  int? online;
  int? type;

  UserProfile(
      {this.access_token,
      this.token,
      this.name,
      this.description,
      this.avatar,
      this.online,
      this.type});

  factory UserProfile.fromJson(Map<String, dynamic> json)  =>
      UserProfile(
      access_token: json["access_token"],
      token: json["token"],
      name: json["name"],
      description: json["description"],
      avatar: json["avatar"],
      online: json["online"],
      type: json["type"]
    );

    Map<String, dynamic> toJson() => {
      "access_token": access_token,
      "token": token,
      "name": name,
      "description": description,
      "avatar": avatar,
      "online": online,
      "type": type
    };
}
