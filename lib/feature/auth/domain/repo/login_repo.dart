import 'package:dartz/dartz.dart';
import '../../../../core/failure/failures.dart';
import '../entity/auth_entity.dart';

abstract class LoginRepo {
  Future<Either<Failures, AuthEntity>> login(String email, String password);
}
