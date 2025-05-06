import 'package:dartz/dartz.dart';
import '../../../../core/failure/failures.dart';
import '../../../../core/utils/api_service.dart';
import '../../domain/entity/get_cart_entity.dart';

abstract class CartDataSource{
  Future<Either<Failures, GetCartEntity>> getCart();
}

class CartDataSourceImpl extends CartDataSource{
  final ApiService apiService;
  CartDataSourceImpl({required this.apiService});

  @override
  Future<Either<Failures, GetCartEntity>> getCart() async {
    var either = await apiService.getCart();
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