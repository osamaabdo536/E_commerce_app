import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/feature/product/domain/repo/product_repo.dart';
import '../../../../core/failure/failures.dart';
import '../entity/delete_or_add_to_favourite_entity.dart';

class DeleteFromFavouriteUseCase{
  ProductRepo deleteFromFavouriteUseCase ;
  DeleteFromFavouriteUseCase({required this.deleteFromFavouriteUseCase});

  Future<Either<Failures, DeleteOrAddToFavouriteEntity>> invoke(String productId){
    return deleteFromFavouriteUseCase.deleteFromFavourite(productId);
  }
}