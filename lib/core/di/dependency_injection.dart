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
import 'package:ecommerce_app/feature/cart/data/data_source/cart_data_source.dart';
import 'package:ecommerce_app/feature/cart/data/repo/cart_repo.dart';
import 'package:ecommerce_app/feature/cart/domain/repo/cart_repo.dart';
import 'package:ecommerce_app/feature/home/data/data_source/home_data_source.dart';
import 'package:ecommerce_app/feature/home/data/repo/home_repo_impl.dart';
import 'package:ecommerce_app/feature/home/domain/repo/home_repo.dart';
import 'package:ecommerce_app/feature/home/domain/use_case/category_use_case.dart';
import 'package:ecommerce_app/feature/product/data/data_source/product_data_source.dart';
import 'package:ecommerce_app/feature/product/data/repo/product_repo_impl.dart';
import 'package:ecommerce_app/feature/product/domain/repo/product_repo.dart';
import 'package:ecommerce_app/feature/product/domain/use_case/GetProducts.dart';
import 'package:ecommerce_app/feature/product/domain/use_case/add_to_cart_use_case.dart';
import 'package:ecommerce_app/feature/product/domain/use_case/add_to_favourite_use_case.dart';
import 'package:ecommerce_app/feature/product/domain/use_case/delete_from_favourite_use_case.dart';
import 'package:ecommerce_app/feature/cart/presentation/cart_cubit/cart_cubit.dart';
import 'package:ecommerce_app/feature/product/presentation/manger/product_cubit/product_cubit.dart';
import 'package:get_it/get_it.dart';
import '../../feature/auth/domain/repo/register_repo.dart';
import '../../feature/cart/domain/use_case/get_cart_use_case.dart';
import '../../feature/home/domain/use_case/brand_use_case.dart';
import '../../feature/home/presentation/cubit/Home_cubit.dart';
import '../../feature/product/domain/use_case/get_favourite.dart';

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

  //Product
  sl.registerLazySingleton<ProductDataSource>(
    () => ProductDataSourceImpl(apiService: sl<ApiService>()),
  );
  sl.registerLazySingleton<ProductRepo>(
    () => ProductRepoImpl(dataSource: sl<ProductDataSource>()),
  );
  sl.registerLazySingleton<GetProductsUseCase>(
        () => GetProductsUseCase(addToCartRepo: sl<ProductRepo>()),
  );
  sl.registerLazySingleton<AddToCartUseCase>(
        () => AddToCartUseCase(addToCartRepo: sl<ProductRepo>()),
  );
  sl.registerLazySingleton<ProductCubit>(
        () => ProductCubit(
      getProductsUseCase: sl<GetProductsUseCase>(),
      addToFavouriteUseCase: sl<AddToFavouriteUseCase>(),
      addToCartUseCase: sl<AddToCartUseCase>(),
      getFavouriteUseCase: sl<GetFavouriteUseCase>(),
      deleteFromFavouriteUseCase: sl<DeleteFromFavouriteUseCase>(),
    ),
  );

  //Cart
  sl.registerLazySingleton<CartDataSource>(
        () => CartDataSourceImpl(apiService: sl<ApiService>()),
  );
  sl.registerLazySingleton<CartRepo>(
        () => CartRepoImpl(dataSource: sl<CartDataSource>()),
  );
  sl.registerLazySingleton<GetCartUseCase>(
    () => GetCartUseCase(cartRepo: sl<CartRepo>()),
  );
  sl.registerLazySingleton<CartCubit>(
        () => CartCubit(getCartUseCase: sl<GetCartUseCase>()),
  );

  //Favourite
  sl.registerLazySingleton<GetFavouriteUseCase>(
    () => GetFavouriteUseCase(getFavouriteRepo: sl<ProductRepo>()),
  );
  sl.registerLazySingleton<AddToFavouriteUseCase>(
    () => AddToFavouriteUseCase(favouriteRepo: sl<ProductRepo>()),
  );
  sl.registerLazySingleton<DeleteFromFavouriteUseCase>(
    () => DeleteFromFavouriteUseCase(
      deleteFromFavouriteUseCase: sl<ProductRepo>(),
    ),
  );



}
