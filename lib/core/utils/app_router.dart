import 'package:ecommerce_app/feature/auth/presentation/login/views/login_view.dart';
import 'package:ecommerce_app/feature/auth/presentation/register/views/register_view.dart';
import 'package:ecommerce_app/feature/home/presentation/view/home_view.dart';
import 'package:ecommerce_app/feature/splash_screen/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

import '../../feature/home/presentation/view/BottomNavigator.dart';

abstract class AppRouter{
  static const splash = '/splashView';
  static const loginView = '/loginView';
  static const registerView = '/registerView';
  static const homeView = '/homeView';

  static final GoRouter router = GoRouter(
    routes:[
      // GoRoute(
      //     path: '/',
      //     builder: (context, state) =>  const SplashView()
      // ),
      GoRoute(
          path: loginView,
          builder: (context, state) =>  const LoginView()
      ),
      GoRoute(
          path: registerView,
          builder: (context, state) =>  const RegisterView()
      ),
      GoRoute(
          path: "/",
          builder: (context, state) =>  const MyHomePage()
      ),
    ],
  );
}
