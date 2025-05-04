import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/feature/home/domain/repo/home_repo.dart';
import '../../../../core/failure/failures.dart';
import '../entity/home_entity.dart';

class CategoryUseCase{
  final HomeRepo categoryRepo;
  CategoryUseCase({required this.categoryRepo});
  Future<Either<Failures, HomeEntity>> invoke() async{
    return await categoryRepo.getAllCategories();
  }
}