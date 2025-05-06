part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

final class GetCartLoading extends CartState {}

final class GetCartError extends CartState {
  final String errorMsg;
  GetCartError({required this.errorMsg});
}

final class GetCartSuccess extends CartState {
  final GetCartEntity getCartEntity;
  GetCartSuccess({required this.getCartEntity});
}
