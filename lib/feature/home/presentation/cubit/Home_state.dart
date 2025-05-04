part of 'Home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}
final class HomeLoading extends HomeState {}
final class HomeError extends HomeState {
  final String errorMsg;
  HomeError({required this.errorMsg});
}
final class HomeSuccess extends HomeState {

}

