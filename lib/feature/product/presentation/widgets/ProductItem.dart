import 'package:ecommerce_app/feature/product/presentation/widgets/info_widget.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/app_theme.dart';
import '../../domain/entity/ProductsEntity.dart';
import 'custom_image.dart';
import 'icon_custom.dart';




class ProductItem extends StatelessWidget {
  ProductItem({Key? key, required this.data}) : super(key: key);

  DatumEntity data;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                data.imageCover!,
                width: MediaQuery.sizeOf(context).width*300/360,
                //height: 150,
                radius: 15,
              ),
              Positioned(
                right: 3,
                top: 5,
                child: _buildFavorite(),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: buildInfo(data: data,),
          )
        ],
      ),

    );
  }

  Widget _buildFavorite() {
    return IconBox(
      bgColor: MyTheme.primaryColor,
      child: Icon(
        Icons.favorite_border,
        color: Colors.white,
        size: 20,
      ),
    );
  }


}
