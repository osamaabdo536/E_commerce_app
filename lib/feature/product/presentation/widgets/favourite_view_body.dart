import 'package:ecommerce_app/feature/product/presentation/manger/product_cubit/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/Dependency_Injection.dart';
import '../../../../core/utils/app_theme.dart';
import '../../../home/presentation/view/widgets/SearchBarCustom.dart';
import 'favourite_item.dart';

class FavouriteViewBody extends StatefulWidget {
  const FavouriteViewBody({super.key});

  @override
  State<FavouriteViewBody> createState() => _FavouriteViewBodyState();
}

class _FavouriteViewBodyState extends State<FavouriteViewBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
          BlocBuilder<ProductCubit, ProductState>(
            builder: (context, state) {
              if(state is GetFavouriteSuccess){
                return Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: state.getFavouriteEntity.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FavouriteItem(data: state.getFavouriteEntity.data![index]),
                      );
                    },
                  ),
                );
              }else{
                return Text('');
              }
            },
          ),

        ],
      ),
    );
  }
}
