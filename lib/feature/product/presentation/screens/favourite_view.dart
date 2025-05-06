import 'package:ecommerce_app/feature/product/presentation/manger/product_cubit/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/Dependency_Injection.dart';
import '../widgets/favourite_view_body.dart';

class FavouriteView extends StatelessWidget {
  const FavouriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return FavouriteViewBody();
  }
}
