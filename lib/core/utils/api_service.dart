import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/failure/failures.dart';
import 'package:ecommerce_app/feature/auth/data/model/request/login_request.dart';
import 'package:ecommerce_app/feature/auth/data/model/response/login_response.dart';
import 'package:http/http.dart' as http;
import '../../feature/auth/data/model/request/register_request.dart';
import '../../feature/auth/data/model/response/register_response.dart';
import 'api_constants.dart';

class ApiService {
  Future<Either<Failures, RegisterResponse>> register(
    String name,
    String email,
    String password,
    String rePassword,
    String phone,
  ) async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.registerApi);
    var requestBody = RegisterRequest(
      name: name,
      email: email,
      password: password,
      rePassword: rePassword,
      phone: phone,
    );
    var response = await http.post(url, body: requestBody.toJson());
    var responseBody = response.body;
    var json = jsonDecode(responseBody);
    var registerResponse = RegisterResponse.fromJson(json);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return Right(registerResponse);
    } else {
      return Left(
        Failures(
          errorMessage:
              registerResponse.error != null
                  ? registerResponse.error!.msg
                  : registerResponse.message,
        ),
      );
    }
  }

  Future<Either<Failures, LoginResponse>> login(
    String email,
    String password,
  ) async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.loginApi);
    var requestBody = LoginRequest(email: email, password: password);
    var response = await http.post(url, body: requestBody.toJson());
    var responseBody = response.body;
    var json = jsonDecode(responseBody);
    var loginResponse = LoginResponse.fromJson(json);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return Right(loginResponse);
    } else {
      return Left(Failures(errorMessage: loginResponse.message));
    }
  }
}
