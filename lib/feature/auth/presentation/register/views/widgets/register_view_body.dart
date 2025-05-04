import 'package:ecommerce_app/core/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../../../../../../core/di/Dependency_Injection.dart';
import '../../../../../../core/utils/app_theme.dart';
import '../../../../../../core/utils/shared_preferences.dart';
import '../../../../../../core/widgets/custom_text_form_filed.dart';
import '../../register_cubit/register_cubit.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterLoading) {
          EasyLoading.show(status: 'loading...');
        }
        if (state is RegisterSuccess) {
          SharedPreferencesUtils.saveData(key: "token", value: state.response.token);
          EasyLoading.showSuccess("User created successfully");
        }
        if (state is RegisterError) {
          EasyLoading.showError(state.errorMsg);
        }
      },
      child: Scaffold(
        backgroundColor: MyTheme.primaryColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              Text(
                "Shopify",
                style: TextStyle(
                  fontSize: 60,
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Form(
                  key: sl<RegisterCubit>().formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Text(
                          'User Name',
                          style: MyTheme.appTheme.textTheme.titleMedium,
                        ),
                        CustomTextFormFiled(
                          hintText: "Enter your full name",
                          controller: sl<RegisterCubit>().nameController,
                          validator: (text) {
                            if (text == null || text.trim().isEmpty) {
                              return 'Please Enter User Name';
                            }
                            return null;
                          },
                        ),
                        Text(
                          'E-mail address',
                          style: MyTheme.appTheme.textTheme.titleMedium,
                        ),
                        CustomTextFormFiled(
                          controller: sl<RegisterCubit>().emailController,
                          validator: (text) {
                            if (text == null || text.trim().isEmpty) {
                              return 'Please Enter Email Address';
                            }
                            bool emailValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                            ).hasMatch(text);
                            if (!emailValid) {
                              return 'Please Enter Valid Email';
                            }
                            return null;
                          },
                          hintText: 'Enter your E-mail address',
                        ),
                        Text(
                          'Password',
                          style: MyTheme.appTheme.textTheme.titleMedium,
                        ),
                        CustomTextFormFiled(
                          hintText: 'Enter your password',
                          controller: sl<RegisterCubit>().passwordController,
                          validator: (text) {
                            if (text == null || text.trim().isEmpty) {
                              return 'Please Enter Password';
                            }
                            if (text.trim().length < 6 ||
                                text.trim().length > 30) {
                              return 'Password should be > 6 & < 30 ';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.visiblePassword,
                          isObscure: sl<RegisterCubit>().isObscure,
                          suffixIcon: InkWell(
                            child:
                                sl<RegisterCubit>().isObscure
                                    ? Icon(Icons.visibility_off)
                                    : Icon(Icons.visibility),
                            onTap: () {
                              if (sl<RegisterCubit>().isObscure) {
                                sl<RegisterCubit>().isObscure = false;
                              } else {
                                sl<RegisterCubit>().isObscure = true;
                              }
                              setState(() {});
                            },
                          ),
                        ),
                        Text(
                          'Confirmation password',
                          style: MyTheme.appTheme.textTheme.titleMedium,
                        ),
                        CustomTextFormFiled(
                          hintText: 'Enter your confirmation password',
                          controller:
                              sl<RegisterCubit>().confirmationController,
                          validator: (text) {
                            if (text == null || text.trim().isEmpty) {
                              return 'Please Enter Confirmation Password';
                            }
                            if (text !=
                                sl<RegisterCubit>().passwordController.text) {
                              return "Password doesn't Match";
                            }
                            return null;
                          },
                          keyboardType: TextInputType.visiblePassword,
                          isObscure: sl<RegisterCubit>().isObscure,
                          suffixIcon: InkWell(
                            child:
                                sl<RegisterCubit>().isObscure
                                    ? Icon(Icons.visibility_off)
                                    : Icon(Icons.visibility),
                            onTap: () {
                              if (sl<RegisterCubit>().isObscure) {
                                sl<RegisterCubit>().isObscure = false;
                              } else {
                                sl<RegisterCubit>().isObscure = true;
                              }
                              setState(() {});
                            },
                          ),
                        ),
                        Text(
                          ' phone',
                          style: MyTheme.appTheme.textTheme.titleMedium,
                        ),
                        CustomTextFormFiled(
                          controller: sl<RegisterCubit>().phoneController,
                          validator: (text) {
                            if (text == null || text.trim().isEmpty) {
                              return 'Enter phone number';
                            }
                            if (text.trim().length < 11) {
                              return 'Please enter correct phone number';
                            }
                            if (text.trim().length > 11) {
                              return 'Please enter correct phone number';
                            }
                            return null;
                          },
                          hintText: 'Enter your phone number',
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomElevatedButton(
                            onPressed: () {
                              sl<RegisterCubit>().register();
                            },
                            text: 'Register',
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account? ",
                              style: Theme.of(context).textTheme.titleMedium
                                  ?.copyWith(color: MyTheme.white),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'SignIn',
                                style: Theme.of(context).textTheme.titleMedium
                                    ?.copyWith(color: MyTheme.white),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}