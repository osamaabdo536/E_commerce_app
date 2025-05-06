import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/failure/failures.dart';
import 'package:ecommerce_app/feature/product/data/data_source/product_data_source.dart';
import 'package:ecommerce_app/feature/product/domain/entity/add_to_cart_entity.dart';
import 'package:ecommerce_app/feature/product/domain/entity/ProductsEntity.dart';
import 'package:ecommerce_app/feature/product/domain/entity/delete_or_add_to_favourite_entity.dart';
import 'package:ecommerce_app/feature/cart/domain/entity/get_cart_entity.dart';
import 'package:ecommerce_app/feature/product/domain/entity/get_favourite_entity.dart';
import 'package:ecommerce_app/feature/product/domain/repo/product_repo.dart';

class ProductRepoImpl implements ProductRepo {
  final ProductDataSource dataSource;

  ProductRepoImpl({required this.dataSource});

  @override
  Future<Either<Failures, AddToCartEntity>> addToCart(String productId) {
    return dataSource.addToCart(productId);
  }

  @override
  Future<Either<Failures, ProductsEntity>> getProducts() {
    return dataSource.getProducts();
  }

  @override
  Future<Either<Failures, DeleteOrAddToFavouriteEntity>> addToFavourite(
    String productId,
  ) {
    return dataSource.addToFavourite(productId);
  }

  @override
  Future<Either<Failures, GetFavouriteEntity>> getFavourite() {
    return dataSource.getFavourite();
  }

  @override
  Future<Either<Failures, DeleteOrAddToFavouriteEntity>> deleteFromFavourite(
    String productId,
  ) {
    return dataSource.deleteFromFavourite(productId);
  }

}
