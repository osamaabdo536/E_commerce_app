part of 'register_cubit.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}
final class RegisterLoading extends RegisterState {}
final class RegisterSuccess extends RegisterState {
  final AuthEntity response;
  RegisterSuccess({required this.response});
}
final class RegisterError extends RegisterState {
  final String errorMsg;
  RegisterError({required this.errorMsg});
}
