import 'package:ecommerce_app/feature/auth/data/model/response/register_response.dart';
import 'package:ecommerce_app/feature/auth/domain/entity/auth_entity.dart';
import 'package:ecommerce_app/feature/auth/domain/use_case/register_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit({required this.registerUseCase}) : super(RegisterInitial());
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController(text: "osama");
  var emailController = TextEditingController(text: 'osama@route.com');
  var passwordController = TextEditingController(text: '123456');
  var confirmationController = TextEditingController(text: '123456');
  var phoneController = TextEditingController(text: '01022554433');
  bool isObscure = true;
  final RegisterUseCase registerUseCase;

  Future<void> register() async {
    if (formKey.currentState?.validate() == true) {
      emit(RegisterLoading());
      var either = await registerUseCase.invoke(
          nameController.text,
          emailController.text,
          passwordController.text,
          confirmationController.text,
          phoneController.text);
      either.fold((l) {
        emit(RegisterError(errorMsg: l.errorMessage!));
      }, (response) {
        emit(RegisterSuccess(response: response));
      });
    }
  }}
