import 'package:dartz/dartz.dart';
import '../../../../core/failure/failures.dart';
import '../entity/get_cart_entity.dart';

abstract class CartRepo{
  Future<Either<Failures, GetCartEntity>> getCart();
}