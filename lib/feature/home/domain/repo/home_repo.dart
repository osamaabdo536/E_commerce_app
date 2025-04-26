import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/failure/failures.dart';
import 'package:ecommerce_app/feature/home/domain/entity/home_entity.dart';

abstract class HomeRepo{
  Future<Either<Failures,HomeEntity>> getAllCategories();
  Future<Either<Failures,HomeEntity>> getAllBrands();
}