import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/failure/failures.dart';
import 'package:ecommerce_app/core/utils/shared_preferences.dart';
import 'package:ecommerce_app/feature/auth/data/model/request/login_request.dart';
import 'package:ecommerce_app/feature/auth/data/model/response/login_response.dart';
import 'package:ecommerce_app/feature/home/data/model/home_model.dart';
import 'package:ecommerce_app/feature/product/data/model/AddToCartResponse.dart';
import 'package:ecommerce_app/feature/product/data/model/ProductsModel.dart';
import 'package:ecommerce_app/feature/product/data/model/delete_or_add_to_favourite_response.dart';
import 'package:ecommerce_app/feature/cart/data/model/get_cart_response.dart';
import 'package:ecommerce_app/feature/product/data/model/get_favourite_response.dart';
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

  Future<Either<Failures, GetCartResponse>> getCart() async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.cartApi);
    var token = SharedPreferencesUtils.getData(key: "token");
    var response = await http.get(url, headers: {"token": token.toString()});
    var responseBody = response.body;
    var json = jsonDecode(responseBody);
    var getCartResponse = GetCartResponse.fromJson(json);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return Right(getCartResponse);
    } else if (response.statusCode == 401) {
      return Left(ServerError(errorMessage: getCartResponse.message!));
    } else {
      return Left(Failures(errorMessage: getCartResponse.message!));
    }
  }

  Future<Either<Failures, AddToCartResponse>> addToCart(
    String productId,
  ) async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.cartApi);
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
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.productsApi);
    var response = await http.get(url);
    var responseBody = response.body;
    var json = jsonDecode(responseBody);
    var productsResponse = ProductsModel.fromJson(json);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return Right(productsResponse);
    } else {
      return Left(Failures(errorMessage: productsResponse.message));
    }
  }

  Future<Either<Failures, ProductsModel>> getFavourite() async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.favouriteApi);
    var token = SharedPreferencesUtils.getData(key: "token");
    var response = await http.get(url, headers: {"token": token.toString()});
    var responseBody = response.body;
    var json = jsonDecode(responseBody);
    var getFavouriteResponse = ProductsModel.fromJson(json);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return Right(getFavouriteResponse);
    } else if (response.statusCode == 401) {
      return Left(ServerError(errorMessage: getFavouriteResponse.message!));
    } else {
      return Left(Failures(errorMessage: getFavouriteResponse.message!));
    }
  }

  Future<Either<Failures, DeleteOrAddToFavouriteResponse>> addToFavourite(
    String productId,
  ) async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.favouriteApi);
    var token = SharedPreferencesUtils.getData(key: "token");
    var response = await http.post(
      url,
      body: {"productId": productId},
      headers: {"token": token.toString()},
    );
    var responseBody = response.body;
    var json = jsonDecode(responseBody);
    var addToFavouriteResponse = DeleteOrAddToFavouriteResponse.fromJson(json);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return Right(addToFavouriteResponse);
    } else if (response.statusCode == 401) {
      return Left(ServerError(errorMessage: addToFavouriteResponse.message!));
    } else {
      return Left(Failures(errorMessage: addToFavouriteResponse.message!));
    }
  }

  Future<Either<Failures, DeleteOrAddToFavouriteResponse>> deleteFromFavourite(
    String productId,
  ) async {
    Uri url = Uri.https(
      ApiConstants.baseUrl,
      "${ApiConstants.favouriteApi}/$productId",
    );
    var token = SharedPreferencesUtils.getData(key: "token");
    var response = await http.delete(url, headers: {"token": token.toString()});
    var responseBody = response.body;
    var json = jsonDecode(responseBody);
    var removeFromFavouriteResponse = DeleteOrAddToFavouriteResponse.fromJson(
      json,
    );
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return Right(removeFromFavouriteResponse);
    } else if (response.statusCode == 401) {
      return Left(
        ServerError(errorMessage: removeFromFavouriteResponse.message!),
      );
    } else {
      return Left(Failures(errorMessage: removeFromFavouriteResponse.message!));
    }
  }
}
