import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/failure/failures.dart';
import 'package:ecommerce_app/feature/auth/data/data_source/login_remote_data_source.dart';
import 'package:ecommerce_app/feature/auth/domain/entity/auth_entity.dart';
import 'package:ecommerce_app/feature/auth/domain/repo/login_repo.dart';

class LoginRepoImpl extends LoginRepo{
  final LoginRemoteDataSource dataSource;
  LoginRepoImpl({required this.dataSource});
  @override
  Future<Either<Failures, AuthEntity>> login(String email, String password) {
    return dataSource.login(email, password);
  }
}