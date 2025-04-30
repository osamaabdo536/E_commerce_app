import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/feature/product/domain/entity/AddToCartEntity.dart';
import '../../../../core/failure/failures.dart';

abstract class AddToCartRepo{
  Future<Either<Failures,AddToCartEntity>> addToCart(String productId);
}
