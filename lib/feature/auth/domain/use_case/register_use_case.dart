import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/feature/auth/domain/entity/auth_entity.dart';
import 'package:ecommerce_app/feature/auth/domain/repo/register_repo.dart';
import '../../../../core/failure/failures.dart';

class RegisterUseCase {
  RegisterRepo registerRepo;
  RegisterUseCase({required this.registerRepo});
  Future<Either<Failures, AuthEntity>> invoke(
    String name,
    String email,
    String password,
    String rePassword,
    String phone,
  ) {
    return registerRepo.register(name, email, password, rePassword, phone);
  }
}
