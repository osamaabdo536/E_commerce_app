import 'package:flutter/material.dart';

import '../../../../core/utils/app_theme.dart';
import '../../domain/entity/ProductsEntity.dart';


class buildInfo extends StatelessWidget {
   buildInfo({super.key,required this.data});
var data;
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
        const SizedBox(
          height: 5,
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
        const SizedBox(
          height: 5,
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
            CircleAvatar(
              minRadius: 15,
              maxRadius: 15,
              backgroundColor: MyTheme.primaryColor,
              child: Icon(Icons.add,color: Colors.white,size: 20,),
            )
          ],
        ),
      ],
    );
  }
}
