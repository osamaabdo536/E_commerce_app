import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/feature/product/domain/repo/product_repo.dart';
import '../../../../core/failure/failures.dart';
import '../entity/delete_or_add_to_favourite_entity.dart';

class AddToFavouriteUseCase {
  final ProductRepo favouriteRepo;

  AddToFavouriteUseCase({required this.favouriteRepo});

  Future<Either<Failures, DeleteOrAddToFavouriteEntity>> invoke(String productId) {
    return favouriteRepo.addToFavourite(productId);
  }
}
