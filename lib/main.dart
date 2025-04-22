import 'package:ecommerce_app/core/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'core/di/dependency_injection.dart';
import 'core/utils/app_router.dart';
import 'core/utils/bloc_observer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  intl();
  Bloc.observer = AppCubitObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      builder: EasyLoading.init(),
      theme: MyTheme.appTheme,
    );
  }
}
