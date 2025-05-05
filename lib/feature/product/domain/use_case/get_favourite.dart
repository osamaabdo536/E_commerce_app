import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/feature/product/domain/repo/product_repo.dart';

import '../../../../core/failure/failures.dart';
import '../entity/get_favourite_entity.dart';

class GetFavouriteUseCase {
  ProductRepo getFavouriteRepo;
  GetFavouriteUseCase({required this.getFavouriteRepo});

  Future<Either<Failures, GetFavouriteEntity>> invoke() {
    return getFavouriteRepo.getFavourite();
  }
}
