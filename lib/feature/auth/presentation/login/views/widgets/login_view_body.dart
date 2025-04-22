import 'package:ecommerce_app/core/utils/shared_preferences.dart';
import 'package:ecommerce_app/feature/auth/presentation/login/login_cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../../core/di/Dependency_Injection.dart';
import '../../../../../../core/utils/app_theme.dart';
import '../../../../../../core/widgets/custom_elevated_button.dart';
import '../../../../../../core/widgets/custom_text_form_filed.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
  listener: (context, state) {
    if (state is LoginLoading) {
      EasyLoading.show(status: 'loading...');
    }
    if (state is LoginSuccess) {
      SharedPreferencesUtils.saveData(key: "token", value: state.response.token);
      EasyLoading.showSuccess("Login successfully");
    }
    if (state is LoginError) {
      EasyLoading.showError(state.errorMsg);
    }
  },
  child: Scaffold(
      backgroundColor: MyTheme.primaryColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              Text(
                "Shopify",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 60,
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              Text(
                'Welcome Back to Shopify',
                textAlign: TextAlign.start,
                style: Theme.of(
                  context,
                ).textTheme.titleMedium!.copyWith(fontSize: 24),
              ),
              Text(
                'Please Sign in with your e-mail',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              Form(
                key: sl<LoginCubit>().formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'User name',
                      style: MyTheme.appTheme.textTheme.titleMedium,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    CustomTextFormFiled(
                      controller: sl<LoginCubit>().emailController,
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
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                    Text(
                      'Password',
                      style: MyTheme.appTheme.textTheme.titleMedium,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    CustomTextFormFiled(
                      hintText: 'Enter your password',
                      controller: sl<LoginCubit>().passwordController,
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return 'Please Enter Password';
                        }
                        if (text.trim().length < 6 || text.trim().length > 30) {
                          return 'Password should be > 6 & < 30 ';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.visiblePassword,
                      isObscure: sl<LoginCubit>().isObscure,
                      suffixIcon: InkWell(
                        child:
                            sl<LoginCubit>().isObscure
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.visibility),
                        onTap: () {
                          if (sl<LoginCubit>().isObscure) {
                            sl<LoginCubit>().isObscure = false;
                          } else {
                            sl<LoginCubit>().isObscure = true;
                          }
                          setState(() {});
                        },
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomElevatedButton(
                        onPressed: () {
                          sl<LoginCubit>().login();
                        },
                        text: 'Login',
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account?",
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(color: MyTheme.white),
                        ),
                        Text(
                          'create an account',
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(color: MyTheme.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
);
  }
}
