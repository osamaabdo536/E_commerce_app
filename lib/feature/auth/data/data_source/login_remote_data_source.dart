import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/utils/api_service.dart';

import '../../../../core/failure/failures.dart';
import '../../domain/entity/auth_entity.dart';

abstract class LoginRemoteDataSource {
  Future<Either<Failures, AuthEntity>> login(String email, String password);
}

class LoginRemoteDataSourceImpl extends LoginRemoteDataSource {
  final ApiService apiService;
  LoginRemoteDataSourceImpl({required this.apiService});
  @override
  Future<Either<Failures, AuthEntity>> login(
    String email,
    String password,
  ) async {
    var either = await apiService.login(email, password);
    return either.fold(
      (failure) {
        return left(Failures(errorMessage: failure.errorMessage));
      },
      (response) {
        return right(response);
      },
    );
  }
}
