import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/feature/product/domain/entity/AddToCartEntity.dart';
import 'package:ecommerce_app/feature/product/domain/use_case/add_to_cart_use_case.dart';
import 'package:meta/meta.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());
  // Future<void> getAllCategories() async {
  //   emit()
  //   var either = await categoryUseCase.invoke();
  //   either.fold(
  //         (failure) {
  //       EasyLoading.dismiss();
  //       emit(HomeError(errorMsg: failure.errorMessage!));
  //     },
  //         (response) {
  //       print(response.data);
  //       categoryDataList = response.data ?? [];
  //     },
  //   );
  // }

}
