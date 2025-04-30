part of 'add_to_cart_cubit.dart';

abstract class AddToCartState {}

final class AddToCartInitial extends AddToCartState {}

final class AddToCartLoading extends AddToCartState {}

final class AddToCartError extends AddToCartState {
  final String errorMsg;
  AddToCartError({required this.errorMsg});
}

final class AddToCartSuccess extends AddToCartState {
  final AddToCartEntity addToCartEntity;

  AddToCartSuccess({required this.addToCartEntity});
}
