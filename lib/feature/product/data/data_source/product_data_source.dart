import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/utils/api_service.dart';
import 'package:ecommerce_app/feature/product/domain/entity/ProductsEntity.dart';
import '../../../../core/failure/failures.dart';
import '../../domain/entity/add_to_cart_entity.dart';
import '../../domain/entity/delete_or_add_to_favourite_entity.dart';
import '../../../cart/domain/entity/get_cart_entity.dart';
import '../../domain/entity/get_favourite_entity.dart';

abstract class ProductDataSource {
  Future<Either<Failures, AddToCartEntity>> addToCart(String productId);
  Future<Either<Failures, ProductsEntity>> getProducts();
  Future<Either<Failures,DeleteOrAddToFavouriteEntity>> addToFavourite(String productId);
  Future<Either<Failures,ProductsEntity>> getFavourite();
  Future<Either<Failures, DeleteOrAddToFavouriteEntity>> deleteFromFavourite(String productId);
}

class ProductDataSourceImpl implements ProductDataSource {
  final ApiService apiService;

  ProductDataSourceImpl({required this.apiService});
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
  Future<Either<Failures, ProductsEntity>> getProducts() async{
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

  @override
  Future<Either<Failures, DeleteOrAddToFavouriteEntity>> addToFavourite(String productId) async {
    var either = await apiService.addToFavourite(productId);
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
  Future<Either<Failures, ProductsEntity>> getFavourite() async {
    var either = await apiService.getFavourite();
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
  Future<Either<Failures, DeleteOrAddToFavouriteEntity>> deleteFromFavourite(String productId) async {
    var either = await apiService.deleteFromFavourite(productId);
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
