import 'package:ecommerce_app/feature/product/domain/use_case/add_to_cart_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entity/AddToCartEntity.dart';
part 'add_to_cart_state.dart';

class AddToCartCubit extends Cubit<AddToCartState> {
  final AddToCartUseCase addToCartUseCase;
  int numberOfCartItem = 0;
  AddToCartCubit({required this.addToCartUseCase}) : super(AddToCartInitial());
  Future<void> addToCart(String productId) async {
    emit(AddToCartLoading());
    var either = await addToCartUseCase.invoke(productId);
    either.fold(
      (failure) {
        emit(AddToCartError(errorMsg: failure.errorMessage!));
      },
      (response) {
        numberOfCartItem = response.numOfCartItems ?? 0 ;
        print("$numberOfCartItem");
        emit(AddToCartSuccess(addToCartEntity: response));
      },
    );
  }
}
