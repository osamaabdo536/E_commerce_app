import 'package:ecommerce_app/feature/auth/domain/entity/auth_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/use_case/login_use_case.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.loginUseCase}) : super(LoginInitial());
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController(text: 'Osamaaaaaaaa@gmail.com');
  var passwordController = TextEditingController(text: '123456');
  bool isObscure = true;
  final LoginUseCase loginUseCase;
  Future<void> login() async {
    if (formKey.currentState?.validate() == true) {
      emit(LoginLoading());
      var either = await loginUseCase.invoke(
        emailController.text,
        passwordController.text,
      );
      either.fold(
        (failure) {
          emit(LoginError(errorMsg: failure.errorMessage!));
        },
        (response) {
          emit(LoginSuccess(response: response));
        },
      );
    }
  }
}
