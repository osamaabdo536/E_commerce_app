import 'package:ecommerce_app/feature/auth/data/model/response/user.dart';
import 'package:ecommerce_app/feature/auth/domain/entity/auth_entity.dart';

class LoginResponse extends AuthEntity {
  LoginResponse({this.message, this.user, this.statusMsg, this.token})
    : super(name: user!.name, token: token, email: user.email);

  LoginResponse.fromJson(dynamic json)
    : super(
        name: json['user']?['name'] ?? '',
        email: json['user']?['email'] ?? '',
        token: json['token'] ?? '',
      ) {
    message = json['message'];
    statusMsg = json['statusMsg'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
  }
  String? message;
  User? user;
  String? token;
  String? statusMsg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['statusMsg'] = statusMsg;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['token'] = token;
    return map;
  }
}
