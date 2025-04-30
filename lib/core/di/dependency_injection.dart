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
import 'package:ecommerce_app/feature/home/data/data_source/home_data_source.dart';
import 'package:ecommerce_app/feature/home/data/repo/home_repo_impl.dart';
import 'package:ecommerce_app/feature/home/domain/repo/home_repo.dart';
import 'package:ecommerce_app/feature/home/domain/use_case/category_use_case.dart';
import 'package:ecommerce_app/feature/product/data/data_source/add_to_cart_data_source.dart';
import 'package:ecommerce_app/feature/product/data/repo/add_to_cart_repo_impl.dart';
import 'package:ecommerce_app/feature/product/domain/repo/add_to_cart_repo.dart';
import 'package:ecommerce_app/feature/product/domain/use_case/GetProducts.dart';
import 'package:ecommerce_app/feature/product/domain/use_case/add_to_cart_use_case.dart';
import 'package:ecommerce_app/feature/product/presentation/manger/add_to_cart_cubit/add_to_cart_cubit.dart';
import 'package:ecommerce_app/feature/product/presentation/manger/product_cubit/product_cubit.dart';
import 'package:get_it/get_it.dart';
import '../../feature/auth/domain/repo/register_repo.dart';
import '../../feature/home/domain/use_case/brand_use_case.dart';
import '../../feature/home/presentation/cubit/Home_cubit.dart';

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
  sl.registerLazySingleton<HomeDataSource>(
    () => HomeDataSourceImpl(apiService: sl<ApiService>()),
  );
  sl.registerLazySingleton<HomeRepo>(
    () => HomeRepoImpl(dataSource: sl<HomeDataSource>()),
  );
  sl.registerLazySingleton<CategoryUseCase>(
    () => CategoryUseCase(categoryRepo: sl<HomeRepo>()),
  );
  sl.registerLazySingleton<BrandUseCase>(
    () => BrandUseCase(homeRepo: sl<HomeRepo>()),
  );
  sl.registerLazySingleton<HomeCubit>(
    () => HomeCubit(categoryUseCase: sl<CategoryUseCase>(), brandUseCase: sl()),
  );

  //AddToCart
  sl.registerLazySingleton<AddToCartDataSource>(
    () => AddToCartDataSourceImpl(apiService: sl<ApiService>()),
  );
  sl.registerLazySingleton<AddToCartRepo>(
    () => AddToCartRepoImpl(dataSource: sl<AddToCartDataSource>()),
  );
  sl.registerLazySingleton<AddToCartUseCase>(
    () => AddToCartUseCase(addToCartRepo: sl<AddToCartRepo>()),
  );
  sl.registerLazySingleton<GetProductsUseCase>(
        () => GetProductsUseCase(addToCartRepo: sl<AddToCartRepo>()),
  );
  sl.registerLazySingleton<AddToCartCubit>(
    () => AddToCartCubit(addToCartUseCase: sl<AddToCartUseCase>()),
  );
  sl.registerLazySingleton<ProductCubit>(
        () => ProductCubit(  getProductsUseCase: sl<GetProductsUseCase>(),),
  );
}
