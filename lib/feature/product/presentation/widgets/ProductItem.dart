import 'package:ecommerce_app/feature/product/presentation/manger/product_cubit/product_cubit.dart';
import 'package:ecommerce_app/feature/product/presentation/widgets/info_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/di/Dependency_Injection.dart';
import '../../../../core/utils/app_router.dart';
import '../../../../core/utils/app_theme.dart';
import '../../domain/entity/ProductsEntity.dart';
import '../screens/ProductDetails.dart';
import 'custom_image.dart';
import 'icon_custom.dart';

class ProductItem extends StatefulWidget {
  ProductItem({Key? key, required this.data,required this.favouriteList}) : super(key: key);
  DatumEntity data;
  List favouriteList;

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  late bool isFavorite;
  ProductCubit productCubit = sl<ProductCubit>();

  @override
  void initState() {
    super.initState();
    isFavorite = widget.favouriteList.contains(widget.data.id);
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push(AppRouter.ProductDetailsView, extra: widget.data);
      },
      child: Container(
        width: double.infinity,
        //height: 700,
        margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: MyTheme.primaryColor,
              spreadRadius: .5,
              blurRadius: 1,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          children: [
            Stack(
              children: [
                CustomImage(
                  widget.data.imageCover!,
                  width: MediaQuery.sizeOf(context).width * 300 / 360,
                  //height: 150,
                  radius: 15,
                ),
                Positioned(
                  right: 3,
                  top: 5,
                  child: InkWell(
                    onTap: () async {
                      setState(() {
                        isFavorite = !isFavorite;
                      });

                      if (isFavorite) {
                        await productCubit.addFavourite(widget.data.id!);
                      } else {
                        await productCubit.deleteFavourite(widget.data.id!);
                      }

                      productCubit.getFavourite(); // Optionally refresh global favorite list
                    },
                    child: _buildFavorite(),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: buildInfo(data: widget.data),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFavorite() {
    return IconBox(
      bgColor: MyTheme.white,
      child: Icon(
        isFavorite ? Icons.favorite_outlined : Icons.favorite_outline,
        color: MyTheme.primaryColor,
        size: 20,
      ),
    );
  }
}
