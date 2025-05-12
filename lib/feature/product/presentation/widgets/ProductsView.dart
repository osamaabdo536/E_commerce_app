import 'package:ecommerce_app/feature/product/presentation/manger/product_cubit/product_cubit.dart';
import 'package:ecommerce_app/feature/product/presentation/manger/product_cubit/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/Dependency_Injection.dart';
import '../../../../core/utils/app_theme.dart';
import '../../../home/presentation/view/widgets/SearchBarCustom.dart';
import 'ProductItem.dart';

class ProductsView extends StatefulWidget {
  const ProductsView({super.key});

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
   ProductCubit productCubit=sl<ProductCubit>();
   List favourite=[];
   List data=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    productCubit.getAllProducts();
    favourite=productCubit.FavouriteDataList;
    data=productCubit.productDataList;
  }
  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.05),
        Text(
          "Shopify",
          style: Theme.of(
            context,
          ).textTheme.titleLarge!.copyWith(color: MyTheme.primaryColor),
        ),
        //SizedBox(height: MediaQuery.of(context).size.height * 0.1),
        SearchBarCustom(),
        BlocListener<ProductCubit, ProductState>(
          bloc: productCubit,
            listener:(context, state){
            if(state is GetFavouriteSuccess){
              favourite=productCubit.FavouriteDataList;
              setState(() {
              });}
            if(state is ProductSuccess){
              data=productCubit.productDataList;
              setState(() {
              });}
            },
          child: data.isNotEmpty?Expanded(
            child: Padding(
               padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
               child: GridView.builder(
                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                   crossAxisCount: 2,
                   crossAxisSpacing: 10,
                   mainAxisSpacing: 10,
                   childAspectRatio: 0.8,
                 ),
                 itemCount: data.length,
                 padding: const EdgeInsets.symmetric(horizontal: 5),
                 itemBuilder: (BuildContext context, int index) {
                   return ProductItem(data: data[index], favouriteList: favourite,);
                 },
               ),
             ),
          ):Text('')

        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.11),
      ],
    );
  }
}
