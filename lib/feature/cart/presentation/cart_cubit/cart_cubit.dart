import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/feature/cart/domain/entity/get_cart_entity.dart';
import 'package:ecommerce_app/feature/cart/domain/use_case/get_cart_use_case.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  GetCartUseCase getCartUseCase;
  CartCubit({required this.getCartUseCase}) : super(CartInitial());

  Future<void> getCart() async {
    emit(GetCartLoading());
    var either = await getCartUseCase.invoke();
    either.fold(
          (failure) {
        emit(GetCartError(errorMsg: failure.errorMessage!));
      },
          (response) {
        emit(GetCartSuccess(getCartEntity: response));
      },
    );
  }
}
