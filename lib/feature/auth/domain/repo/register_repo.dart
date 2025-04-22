import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/failure/failures.dart';
import 'package:ecommerce_app/feature/auth/domain/entity/auth_entity.dart';

abstract class RegisterRepo {
  Future<Either<Failures, AuthEntity>> register(
    String name,
    String email,
    String password,
    String rePassword,
    String phone,
  );
}
