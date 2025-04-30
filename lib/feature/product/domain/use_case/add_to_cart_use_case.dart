import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/feature/product/domain/repo/add_to_cart_repo.dart';
import '../../../../core/failure/failures.dart';
import '../entity/AddToCartEntity.dart';

class AddToCartUseCase {
  final AddToCartRepo addToCartRepo;

  AddToCartUseCase({required this.addToCartRepo});
  Future<Either<Failures, AddToCartEntity>> invoke(String productId) {
    return addToCartRepo.addToCart(productId);
  }
}
