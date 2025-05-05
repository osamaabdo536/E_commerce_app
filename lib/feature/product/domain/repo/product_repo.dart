import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/feature/product/domain/entity/add_to_cart_entity.dart';
import 'package:ecommerce_app/feature/product/domain/entity/ProductsEntity.dart';
import 'package:ecommerce_app/feature/product/domain/entity/delete_or_add_to_favourite_entity.dart';
import '../../../../core/failure/failures.dart';
import '../entity/get_favourite_entity.dart';

abstract class ProductRepo {
  Future<Either<Failures, AddToCartEntity>> addToCart(String productId);
  Future<Either<Failures, ProductsEntity>> getProducts();
  Future<Either<Failures, DeleteOrAddToFavouriteEntity>> addToFavourite(String productId);
  Future<Either<Failures, GetFavouriteEntity>> getFavourite();
  Future<Either<Failures, DeleteOrAddToFavouriteEntity>> deleteFromFavourite(String productId);

}
