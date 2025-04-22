import 'package:ecommerce_app/feature/auth/presentation/register/views/widgets/register_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/di/Dependency_Injection.dart';
import '../register_cubit/register_cubit.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<RegisterCubit>(),
      child: RegisterViewBody(),
    );
  }
}
