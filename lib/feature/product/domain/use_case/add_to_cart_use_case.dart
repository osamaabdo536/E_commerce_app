import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/feature/product/domain/repo/product_repo.dart';
import '../../../../core/failure/failures.dart';
import '../entity/add_to_cart_entity.dart';

class AddToCartUseCase {
  final ProductRepo addToCartRepo;

  AddToCartUseCase({required this.addToCartRepo});
  Future<Either<Failures, AddToCartEntity>> invoke(String productId) {
    return addToCartRepo.addToCart(productId);
  }
}
