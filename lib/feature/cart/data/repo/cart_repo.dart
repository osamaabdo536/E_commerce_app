import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/failure/failures.dart';
import 'package:ecommerce_app/feature/cart/data/data_source/cart_data_source.dart';
import 'package:ecommerce_app/feature/cart/domain/entity/get_cart_entity.dart';
import '../../domain/repo/cart_repo.dart';

class CartRepoImpl extends CartRepo {
  final CartDataSource dataSource;
  CartRepoImpl({required this.dataSource});
  @override
  Future<Either<Failures, GetCartEntity>> getCart() {
    return dataSource.getCart();
  }
}
