import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/feature/home/domain/entity/category_entity.dart';
import 'package:ecommerce_app/feature/home/domain/use_case/category_use_case.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:meta/meta.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit({required this.useCase}) : super(CategoryInitial());
  final CategoryUseCase useCase;
  List<DataEntity>? categoryDataList;
  Future<void> getAllCategories() async {
    if (!isClosed) emit(CategoryLoading());

    EasyLoading.show(status: 'loading...');
    var either = await useCase.invoke();
    either.fold(
      (failure) {
        EasyLoading.dismiss();
        emit(CategoryError(errorMsg: failure.errorMessage!));
      },
      (response) {
        EasyLoading.dismiss();
        categoryDataList = categoryDataList ?? [];
        emit(CategorySuccess(categoryEntity: response));
      },
    );
  }
}
