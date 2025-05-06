import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/feature/cart/domain/repo/cart_repo.dart';
import '../../../../core/failure/failures.dart';
import '../entity/get_cart_entity.dart';

class GetCartUseCase{
  CartRepo cartRepo;
  GetCartUseCase({required this.cartRepo});
  Future<Either<Failures, GetCartEntity>> invoke(){
    return cartRepo.getCart();
  }
}