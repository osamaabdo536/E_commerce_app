import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/failure/failures.dart';
import 'package:ecommerce_app/feature/home/data/data_source/category_data_source.dart';
import 'package:ecommerce_app/feature/home/domain/entity/category_entity.dart';
import 'package:ecommerce_app/feature/home/domain/repo/category_repo.dart';

class CategoryRepoImpl implements CategoryRepo{
  final CategoryDataSource dataSource;
  CategoryRepoImpl({required this.dataSource});
  @override
  Future<Either<Failures, CategoryEntity>> getAllCategories() {
  return dataSource.getAllCategories();
  }
}