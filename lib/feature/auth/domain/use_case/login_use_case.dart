import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/feature/auth/domain/repo/login_repo.dart';
import '../../../../core/failure/failures.dart';
import '../entity/auth_entity.dart';

class LoginUseCase{
  final LoginRepo loginRepo;
  LoginUseCase({required this.loginRepo});
  Future<Either<Failures, AuthEntity>> invoke(String email, String password){
    return loginRepo.login(email, password);
  }
}