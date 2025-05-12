import 'package:ecommerce_app/feature/product/presentation/manger/product_cubit/product_cubit.dart';
import 'package:flutter/material.dart';

import '../../../../core/di/Dependency_Injection.dart';
import '../../../../core/utils/app_theme.dart';
import '../../domain/entity/ProductsEntity.dart';


class buildInfo extends StatelessWidget {
   buildInfo({super.key,required this.data});
   DatumEntity data;
ProductCubit productCubit=sl<ProductCubit>();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          data.title!,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: MyTheme.primaryColor,
              fontSize: 16,
            fontWeight: FontWeight.bold
          )
        ),
         SizedBox(
          height: MediaQuery.sizeOf(context).height*5/776,
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Text(
                "EGP "+data.price.toString()!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: MyTheme.primaryColor,
                    fontSize: 14
                ),
              ),
            ),
          ],
        ),
         SizedBox(
           height: MediaQuery.sizeOf(context).height*5/776,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  "Reviews ("+data.ratingsAverage.toString()!+")",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: MyTheme.primaryColor,
                    fontSize: 12
                  ),
                ),
                Icon(Icons.star,color: Colors.yellow,)
              ],
            ),
            InkWell(
              onTap: (){
                productCubit.addToCart(data.id!);
              },
              child: CircleAvatar(
                minRadius: 15,
                maxRadius: 15,
                backgroundColor: MyTheme.primaryColor,
                child: Icon(Icons.add,color: Colors.white,size: 20,),
              ),
            )
          ],
        ),
      ],
    );
  }
}
