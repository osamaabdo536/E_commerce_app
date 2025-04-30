import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/feature/product/domain/entity/AddToCartEntity.dart';
import 'package:ecommerce_app/feature/product/domain/use_case/GetProducts.dart';
import 'package:ecommerce_app/feature/product/domain/use_case/add_to_cart_use_case.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:meta/meta.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  GetProductsUseCase getProductsUseCase;
  List ProductDataList=[];
  ProductCubit({required this.getProductsUseCase}) : super(ProductInitial());
  Future<void> getAllProducts() async {
    emit(ProductLoading());
    var either = await getProductsUseCase.invoke();
    either.fold(
          (failure) {
        EasyLoading.dismiss();
        emit(ProductError(errorMsg: failure.errorMessage!));
      },
          (response) {
        print(response.data);
        ProductDataList = response.data ?? [];
        emit(ProductSuccess());
      },
    );
  }

}
