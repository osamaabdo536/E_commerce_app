import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/failure/failures.dart';
import 'package:ecommerce_app/feature/home/data/data_source/home_data_source.dart';
import 'package:ecommerce_app/feature/home/domain/entity/home_entity.dart';
import 'package:ecommerce_app/feature/home/domain/repo/home_repo.dart';

class HomeRepoImpl implements HomeRepo{
  final HomeDataSource dataSource;
  HomeRepoImpl({required this.dataSource});
  @override
  Future<Either<Failures, HomeEntity>> getAllCategories() {
  return dataSource.getAllCategories();
  }

  @override
  Future<Either<Failures, HomeEntity>> getAllBrands() {
    return dataSource.getAllBrands();
  }
}