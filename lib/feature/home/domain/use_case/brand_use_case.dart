import 'package:dartz/dartz.dart';

import '../../../../core/failure/failures.dart';
import '../entity/home_entity.dart';
import '../repo/home_repo.dart';

class BrandUseCase{
  final HomeRepo homeRepo;
  BrandUseCase({required this.homeRepo});
  Future<Either<Failures, HomeEntity>> invoke() async{
    return await homeRepo.getAllBrands();
  }
}