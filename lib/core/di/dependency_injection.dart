import 'package:ecommerce_app/core/utils/api_service.dart';
import 'package:ecommerce_app/feature/auth/data/data_source/login_remote_data_source.dart';
import 'package:ecommerce_app/feature/auth/data/data_source/register_remote_data_source.dart';
import 'package:ecommerce_app/feature/auth/data/repo/login_repo_impl.dart';
import 'package:ecommerce_app/feature/auth/data/repo/register_repo_impl.dart';
import 'package:ecommerce_app/feature/auth/domain/repo/login_repo.dart';
import 'package:ecommerce_app/feature/auth/domain/use_case/login_use_case.dart';
import 'package:ecommerce_app/feature/auth/domain/use_case/register_use_case.dart';
import 'package:ecommerce_app/feature/auth/presentation/login/login_cubit/login_cubit.dart';
import 'package:ecommerce_app/feature/auth/presentation/register/register_cubit/register_cubit.dart';
import 'package:ecommerce_app/feature/home/data/data_source/category_data_source.dart';
import 'package:ecommerce_app/feature/home/data/repo/category_repo_impl.dart';
import 'package:ecommerce_app/feature/home/domain/repo/category_repo.dart';
import 'package:ecommerce_app/feature/home/domain/use_case/category_use_case.dart';
import 'package:ecommerce_app/feature/home/presentation/category_cubit/category_cubit.dart';
import 'package:get_it/get_it.dart';
import '../../feature/auth/domain/repo/register_repo.dart';

final sl = GetIt.instance;

void intl() {
  //Register
  sl.registerLazySingleton<ApiService>(() => ApiService());
  sl.registerLazySingleton<RegisterRemoteDataSource>(
    () => RegisterRemoteDataSourceImpl(apiService: sl<ApiService>()),
  );
  sl.registerLazySingleton<RegisterRepo>(
    () => RegisterRepoImpl(dataSource: sl<RegisterRemoteDataSource>()),
  );
  sl.registerLazySingleton<RegisterUseCase>(
    () => RegisterUseCase(registerRepo: sl<RegisterRepo>()),
  );
  sl.registerLazySingleton(
    () => RegisterCubit(registerUseCase: sl<RegisterUseCase>()),
  );

  //Login
  sl.registerLazySingleton<LoginRemoteDataSource>(
    () => LoginRemoteDataSourceImpl(apiService: sl<ApiService>()),
  );
  sl.registerLazySingleton<LoginRepo>(
    () => LoginRepoImpl(dataSource: sl<LoginRemoteDataSource>()),
  );
  sl.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(loginRepo: sl<LoginRepo>()),
  );
  sl.registerLazySingleton<LoginCubit>(
    () => LoginCubit(loginUseCase: sl<LoginUseCase>()),
  );

  //Category
  sl.registerLazySingleton<CategoryDataSource>(
        () => CategoryDataSourceImpl(apiService: sl<ApiService>()),
  );
  sl.registerLazySingleton<CategoryRepo>(
        () => CategoryRepoImpl(dataSource: sl<CategoryDataSource>()),
  );
  sl.registerLazySingleton<CategoryUseCase>(
        () => CategoryUseCase(categoryRepo: sl<CategoryRepo>()),
  );
  sl.registerLazySingleton<CategoryCubit>(
        () => CategoryCubit(useCase: sl<CategoryUseCase>()),
  );
}
