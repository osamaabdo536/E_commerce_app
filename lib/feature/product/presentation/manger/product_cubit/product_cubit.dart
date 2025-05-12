import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/feature/product/domain/entity/ProductsEntity.dart';
import 'package:ecommerce_app/feature/product/domain/entity/add_to_cart_entity.dart';
import 'package:ecommerce_app/feature/product/domain/entity/get_favourite_entity.dart';
import 'package:ecommerce_app/feature/product/domain/use_case/GetProducts.dart';
import 'package:ecommerce_app/feature/product/domain/use_case/add_to_cart_use_case.dart';
import 'package:ecommerce_app/feature/product/domain/use_case/delete_from_favourite_use_case.dart';
import 'package:ecommerce_app/feature/product/domain/use_case/get_favourite.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:meta/meta.dart';

import '../../../domain/entity/delete_or_add_to_favourite_entity.dart';
import '../../../domain/use_case/add_to_favourite_use_case.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  GetProductsUseCase getProductsUseCase;
  AddToFavouriteUseCase addToFavouriteUseCase;
  AddToCartUseCase addToCartUseCase;
  GetFavouriteUseCase getFavouriteUseCase;
  DeleteFromFavouriteUseCase deleteFromFavouriteUseCase;
  List productDataList = [];
  List FavouriteDataList = [];
  int numberOfCartItem = 0;
  ProductCubit({
    required this.getProductsUseCase,
    required this.addToFavouriteUseCase,
    required this.addToCartUseCase,
    required this.getFavouriteUseCase,
    required this.deleteFromFavouriteUseCase,
  }) : super(ProductInitial());
static ProductCubit get(context)=>BlocProvider.of<ProductCubit>(context);
  Future<void> getAllProducts() async {
    await getFavourite();
    emit(ProductLoading());
    EasyLoading.show(status: 'loading...');
    var either = await getProductsUseCase.invoke();
    either.fold(
      (failure) {
        print(failure.errorMessage);
        EasyLoading.dismiss();
        emit(ProductError(errorMsg: failure.errorMessage!));
      },
      (response) {
        EasyLoading.dismiss();
        productDataList = response.data ?? [];
        emit(ProductSuccess());
      },
    );
  }

  Future<void> addToCart(String productId) async {
    emit(ProductLoading());
    var either = await addToCartUseCase.invoke(productId);
    either.fold(
          (failure) {
        emit(ProductError(errorMsg: failure.errorMessage!));
      },
          (response) {
        numberOfCartItem = response.numOfCartItems ?? 0 ;
        print("$numberOfCartItem");
        emit(AddToCartSuccess(addToCartEntity: response));
      },
    );
  }

  Future<void> getFavourite() async {
    emit(ProductLoading());
    var either = await getFavouriteUseCase.invoke();
    either.fold(
          (failure) {
        emit(ProductError(errorMsg: failure.errorMessage!));
      },
          (response) {
            FavouriteDataList=response.data!.map((x)=>x.id).toList();
        emit(GetFavouriteSuccess(getFavouriteEntity: response));
      },
    );
  }

  Future<void> addFavourite(String productId) async {
    emit(ProductLoading());
    var either = await addToFavouriteUseCase.invoke(productId);
    either.fold(
      (failure) {
        emit(ProductError(errorMsg: failure.errorMessage!));
      },
      (response) {
        emit(DeleteOrAddToFavouriteSuccess(addToFavouriteEntity: response));
      },
    );
  }

  Future<void> deleteFavourite(String productId) async {
    emit(ProductLoading());
    var either = await deleteFromFavouriteUseCase.invoke(productId);
    either.fold(
          (failure) {
        emit(ProductError(errorMsg: failure.errorMessage!));
      },
          (response) {
        emit(DeleteOrAddToFavouriteSuccess(addToFavouriteEntity: response));
      },
    );
  }

}
