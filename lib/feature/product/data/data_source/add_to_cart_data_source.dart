import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/utils/api_service.dart';
import 'package:ecommerce_app/feature/product/domain/entity/ProductsEntity.dart';
import '../../../../core/failure/failures.dart';
import '../../domain/entity/AddToCartEntity.dart';

abstract class AddToCartDataSource {
  Future<Either<Failures, AddToCartEntity>> addToCart(String productId);
  Future<Either<Failures, ProductsEntity>> GetProducts();
}

class AddToCartDataSourceImpl implements AddToCartDataSource {
  final ApiService apiService;

  AddToCartDataSourceImpl({required this.apiService});
  @override
  Future<Either<Failures, AddToCartEntity>> addToCart(String productId) async {
    var either = await apiService.addToCart(productId);
    return either.fold(
      (failure) {
        return left(Failures(errorMessage: failure.errorMessage));
      },
      (response) {
        return right(response);
      },
    );
  }

  @override
  Future<Either<Failures, ProductsEntity>> GetProducts() async{
    var either = await apiService.getAllProducts();
    return either.fold(
          (failure) {
        return left(Failures(errorMessage: failure.errorMessage));
      },
          (response) {
        return right(response);
      },
    );
  }
}
