import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/feature/product/domain/entity/ProductsEntity.dart';

import '../../../../core/failure/failures.dart';
import '../entity/AddToCartEntity.dart';
import '../repo/add_to_cart_repo.dart';

class GetProductsUseCase {
  final AddToCartRepo addToCartRepo;

  GetProductsUseCase({required this.addToCartRepo});
  Future<Either<Failures, ProductsEntity>> invoke() {
    return addToCartRepo.getProducts();
  }
}