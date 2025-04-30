import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/utils/api_service.dart';
import '../../../../core/failure/failures.dart';
import '../../domain/entity/AddToCartEntity.dart';

abstract class AddToCartDataSource {
  Future<Either<Failures, AddToCartEntity>> addToCart(String productId);
}

class AddToCartDataSourceImpl implements AddToCartDataSource {
  final ApiService apiService;

  AddToCartDataSourceImpl({required this.apiService});
  @override
  Future<Either<Failures, AddToCartEntity>> addToCart(String productId) async {
    var either = await apiService.addToCart(productId);
    return either.fold(
      (failure) {
        return left(Failures(errorMessage: failure.errorMessage));
      },
      (response) {
        return right(response);
      },
    );
  }
}
