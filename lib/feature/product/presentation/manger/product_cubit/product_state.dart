part of 'product_cubit.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}

final class ProductLoading extends ProductState {}

final class ProductSuccess extends ProductState {}

final class ProductError extends ProductState {
  final String errorMsg;

  ProductError({required this.errorMsg});
}
final class DeleteOrAddToFavouriteSuccess extends ProductState {
  final DeleteOrAddToFavouriteEntity addToFavouriteEntity;

  DeleteOrAddToFavouriteSuccess({required this.addToFavouriteEntity});
}
final class AddToCartSuccess extends ProductState {
  final AddToCartEntity addToCartEntity;

  AddToCartSuccess({required this.addToCartEntity});
}
final class GetFavouriteSuccess extends ProductState {
  final ProductsEntity getFavouriteEntity;

  GetFavouriteSuccess({required this.getFavouriteEntity});
}