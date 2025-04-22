import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/feature/home/domain/repo/category_repo.dart';
import '../../../../core/failure/failures.dart';
import '../entity/category_entity.dart';

class CategoryUseCase{
  final CategoryRepo categoryRepo;
  CategoryUseCase({required this.categoryRepo});
  Future<Either<Failures, CategoryEntity>> invoke(){
    return categoryRepo.getAllCategories();
  }
}