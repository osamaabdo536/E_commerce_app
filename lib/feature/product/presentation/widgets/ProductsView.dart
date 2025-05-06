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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    productCubit.getAllProducts();
  }
  @override
  Widget build(BuildContext context) {

    return BlocBuilder<ProductCubit, ProductState>(
      bloc: productCubit,
      builder: (context, state) {
       if(state is ProductSuccess){
         var data=productCubit.productDataList;
         return Padding(
           padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
           child: Column(
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
               Expanded(
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
                     return ProductItem(data: data[index],);
                   },
                 ),
               ),
               SizedBox(height: MediaQuery.of(context).size.height * 0.11),
             ],
           ),
         );
       }
       else{
         return Text('');
       }
      },
    );
  }
}
