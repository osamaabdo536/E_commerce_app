import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/failure/failures.dart';
import 'package:ecommerce_app/feature/home/domain/entity/category_entity.dart';

abstract class CategoryRepo{
  Future<Either<Failures,CategoryEntity>> getAllCategories();
}