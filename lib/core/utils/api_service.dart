import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/failure/failures.dart';
import 'package:ecommerce_app/core/utils/shared_preferences.dart';
import 'package:ecommerce_app/feature/auth/data/model/request/login_request.dart';
import 'package:ecommerce_app/feature/auth/data/model/response/login_response.dart';
import 'package:ecommerce_app/feature/home/data/model/home_model.dart';
import 'package:ecommerce_app/feature/product/data/model/AddToCartResponse.dart';
import 'package:ecommerce_app/feature/product/data/model/ProductsModel.dart';
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

  Future<Either<Failures, HomeModel>> getAllCategory() async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.categoriesApi);
    var response = await http.get(url);
    var responseBody = response.body;
    var json = jsonDecode(responseBody);
    var categoryResponse = HomeModel.fromJson(json);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return Right(categoryResponse);
    } else {
      return Left(Failures(errorMessage: categoryResponse.message!));
    }
  }

  Future<Either<Failures, HomeModel>> getAllBrand() async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.brandApi);
    var response = await http.get(url);
    var responseBody = response.body;
    var json = jsonDecode(responseBody);
    var brandResponse = HomeModel.fromJson(json);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return Right(brandResponse);
    } else {
      return Left(Failures(errorMessage: brandResponse.message!));
    }
  }

  Future<Either<Failures, AddToCartResponse>> addToCart(String productId,) async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.addToCartApi);
    var token = SharedPreferencesUtils.getData(key: "token");
    var response = await http.post(
      url,
      body: {"productId": productId},
      headers: {"token": token.toString()},
    );
    var responseBody = response.body;
    var json = jsonDecode(responseBody);
    var addToCartResponse = AddToCartResponse.fromJson(json);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return Right(addToCartResponse);
    } else if (response.statusCode == 401) {
      return Left(ServerError(errorMessage: addToCartResponse.message!));
    } else {
      return Left(Failures(errorMessage: addToCartResponse.message!));
    }
  }


  Future<Either<Failures, ProductsModel>> getAllProducts() async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.ProductsApi);
    var response = await http.get(url);
    var responseBody = response.body;
    var json = jsonDecode(responseBody);
    var ProductsResponse = ProductsModel.fromJson(json);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return Right(ProductsResponse);
    } else {
      return Left(Failures(errorMessage: "Check your Internet"));
    }
  }
}
