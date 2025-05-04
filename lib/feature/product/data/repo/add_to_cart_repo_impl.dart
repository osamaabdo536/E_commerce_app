import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/failure/failures.dart';
import 'package:ecommerce_app/feature/product/data/data_source/add_to_cart_data_source.dart';
import 'package:ecommerce_app/feature/product/domain/entity/AddToCartEntity.dart';
import 'package:ecommerce_app/feature/product/domain/entity/ProductsEntity.dart';
import 'package:ecommerce_app/feature/product/domain/repo/add_to_cart_repo.dart';

class AddToCartRepoImpl implements AddToCartRepo {
  final AddToCartDataSource dataSource;

  AddToCartRepoImpl({required this.dataSource});

  @override
  Future<Either<Failures, AddToCartEntity>> addToCart(String productId) {
    return dataSource.addToCart(productId);
  }

  @override
  Future<Either<Failures, ProductsEntity>> getProducts() {
    return dataSource.GetProducts();
  }
}
