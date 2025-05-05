import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/feature/product/domain/entity/ProductsEntity.dart';

import '../../../../core/failure/failures.dart';
import '../entity/add_to_cart_entity.dart';
import '../repo/product_repo.dart';

class GetProductsUseCase {
  final ProductRepo addToCartRepo;

  GetProductsUseCase({required this.addToCartRepo});
  Future<Either<Failures, ProductsEntity>> invoke() {
    return addToCartRepo.getProducts();
  }
}