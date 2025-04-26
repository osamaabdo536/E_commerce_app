import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/feature/home/domain/entity/home_entity.dart';
import 'package:ecommerce_app/feature/home/domain/use_case/category_use_case.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:meta/meta.dart';

import '../../domain/use_case/brand_use_case.dart';

part 'Home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.categoryUseCase,required this.brandUseCase}) : super(HomeInitial());
  final CategoryUseCase categoryUseCase;
  final BrandUseCase brandUseCase;
  List<DataEntity>? categoryDataList;
  List<DataEntity>? brandDataList;
  Future<void> getAllCategories() async {
    if (!isClosed) emit(HomeLoading());

    EasyLoading.show(status: 'loading...');
    var either = await categoryUseCase.invoke();
    either.fold(
      (failure) {
        EasyLoading.dismiss();
        emit(HomeError(errorMsg: failure.errorMessage!));
      },
      (response) {
        categoryDataList = response.data ?? [];
      },
    );
  }
  Future<void> getAllBrand() async {
    var either = await brandUseCase.invoke();
    either.fold(
          (failure) {
        EasyLoading.dismiss();
        emit(HomeError(errorMsg: failure.errorMessage!));
      },
          (response) {
        EasyLoading.dismiss();
        brandDataList = response.data ?? [];
        emit(HomeSuccess());
      },
    );
  }
}
