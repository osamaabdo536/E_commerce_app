import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/utils/api_service.dart';
import '../../../../core/failure/failures.dart';
import '../../domain/entity/category_entity.dart';

abstract class CategoryDataSource{
  Future<Either<Failures,CategoryEntity>> getAllCategories();
}

class CategoryDataSourceImpl implements CategoryDataSource{
  final ApiService apiService;
  CategoryDataSourceImpl({required this.apiService});
  @override
  Future<Either<Failures, CategoryEntity>> getAllCategories() async {
   var either = await apiService.getAllCategory();
   return either.fold((failure){
     return left(Failures(errorMessage: failure.errorMessage));
   }, (response){
     return right(response);
   });
  }
}