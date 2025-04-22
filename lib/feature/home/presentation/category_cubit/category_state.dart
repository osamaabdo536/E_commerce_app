part of 'category_cubit.dart';

@immutable
sealed class CategoryState {}

final class CategoryInitial extends CategoryState {}
final class CategoryLoading extends CategoryState {}
final class CategoryError extends CategoryState {
  final String errorMsg;
  CategoryError({required this.errorMsg});
}
final class CategorySuccess extends CategoryState {
  final CategoryEntity categoryEntity;
  CategorySuccess({required this.categoryEntity});
}

