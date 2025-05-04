import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/failure/failures.dart';
import 'package:ecommerce_app/feature/auth/data/data_source/register_remote_data_source.dart';
import 'package:ecommerce_app/feature/auth/domain/entity/auth_entity.dart';
import '../../domain/repo/register_repo.dart';

class RegisterRepoImpl implements RegisterRepo {
  final RegisterRemoteDataSource dataSource;
  RegisterRepoImpl({required this.dataSource});
  @override
  Future<Either<Failures, AuthEntity>> register(
    String name,
    String email,
    String password,
    String rePassword,
    String phone,
  ) async {
    var response = await dataSource.register(
      name,
      email,
      password,
      rePassword,
      phone,
    );
    return response;
  }
}
