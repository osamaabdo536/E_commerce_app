import 'package:ecommerce_app/feature/auth/data/model/response/error.dart';
import 'package:ecommerce_app/feature/auth/data/model/response/user.dart';
import 'package:ecommerce_app/feature/auth/domain/entity/auth_entity.dart';

class RegisterResponse extends AuthEntity {
  RegisterResponse({
    this.message,
    this.user,
    this.error,
    this.statusMsg,
    this.token,
  }) : super(name: user!.name, token: token, email: user.email);

  RegisterResponse.fromJson(dynamic json)
    : super(
        name: json['user']?['name'] ?? '',
        email: json['user']?['email'] ?? '',
        token: json['token'] ?? '',
      ) {
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    error = json['errors'] != null ? Error.fromJson(json['errors']) : null;
    token = json['token'];
  }
  String? message;
  User? user;
  Error? error;
  String? statusMsg;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['statusMsg'] = statusMsg;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    if (error != null) {
      map['errors'] = error?.toJson();
    }
    map['token'] = token;
    return map;
  }
}
