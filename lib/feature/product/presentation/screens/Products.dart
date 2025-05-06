import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/Dependency_Injection.dart';
import '../manger/product_cubit/product_cubit.dart';
import '../widgets/ProductsView.dart';

class Products extends StatelessWidget {
  const Products({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ProductsView(),
    );
  }
}
