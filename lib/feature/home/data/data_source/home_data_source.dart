import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/utils/api_service.dart';
import '../../../../core/failure/failures.dart';
import '../../domain/entity/home_entity.dart';

abstract class HomeDataSource{
  Future<Either<Failures,HomeEntity>> getAllCategories();
  Future<Either<Failures,HomeEntity>> getAllBrands();
}

class HomeDataSourceImpl implements HomeDataSource{
  final ApiService apiService;
  HomeDataSourceImpl({required this.apiService});
  @override
  Future<Either<Failures, HomeEntity>> getAllCategories() async {
   var either = await apiService.getAllCategory();
   return either.fold((failure){
     return left(Failures(errorMessage: failure.errorMessage));
   }, (response){
     return right(response);
   });
  }

  @override
  Future<Either<Failures, HomeEntity>> getAllBrands() async{
    var either = await apiService.getAllBrand();
    return either.fold((failure){
      return left(Failures(errorMessage: failure.errorMessage));
    }, (response){
      return right(response);
    });
  }
}