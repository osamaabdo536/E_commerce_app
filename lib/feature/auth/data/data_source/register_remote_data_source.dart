import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/failure/failures.dart';
import 'package:ecommerce_app/core/utils/api_service.dart';
import 'package:ecommerce_app/feature/auth/domain/entity/auth_entity.dart';

abstract class RegisterRemoteDataSource {
  Future<Either<Failures,AuthEntity>> register(
    String name,
    String email,
    String password,
    String rePassword,
    String phone,
  );
}

class RegisterRemoteDataSourceImpl implements RegisterRemoteDataSource {
  final ApiService apiService;

  RegisterRemoteDataSourceImpl({required this.apiService});
  @override
  Future<Either<Failures,AuthEntity>> register(
    String name,
    String email,
    String password,
    String rePassword,
    String phone,
  ) async {
    var either =
    await apiService.register(name, email, password, rePassword, phone);
    return either.fold((l) {
      return Left(Failures(errorMessage: l.errorMessage));
    }, (response) {
      return Right(response);
    });
  }
}
