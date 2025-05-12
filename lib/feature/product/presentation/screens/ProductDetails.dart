import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

import '../../../../core/utils/app_theme.dart';
import '../../domain/entity/ProductsEntity.dart';
import '../widgets/ImageSlider.dart';
import '../widgets/Session.dart';

class ProductDetails extends StatefulWidget {
   ProductDetails({super.key,required this.data});
  DatumEntity data;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int count=1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Imageslider(images: widget.data.images!,),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                      widget.data.title!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: MyTheme.primaryColor,
                          fontWeight: FontWeight.bold
                      )
                  ),
                ),
                Text(
                    "EGP ${widget.data.price}",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: MyTheme.primaryColor,

                        fontWeight: FontWeight.bold
                    )
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    border: Border.all(color:MyTheme.grey,width: 2 ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                      "${widget.data.sold!} sold",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: MyTheme.primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                      )
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "Reviews ("+widget.data.ratingsAverage.toString()!+")",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: MyTheme.primaryColor,
                          fontSize: 14
                      ),
                    ),
                    Icon(Icons.star,color: Colors.yellow,)
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    color: MyTheme.primaryColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          if(count>1){
                            setState(() {
                              count--;
                            });
                          }
                        },
                        icon: Icon(
                          Icons.remove_circle_outline_outlined,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                      Text(
                        '${count}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 19,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            count++;
                          });
                        },
                        icon: Icon(
                          Icons.add_circle_outline_outlined,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SessionTile(title: 'Description', info: widget.data.description!,),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            Row(
              children: [
                Text(
                    "Quantity :  ",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: MyTheme.primaryColor,
                        fontWeight: FontWeight.bold
                    )
                ),
                Text(
                    "${widget.data.quantity}",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: MyTheme.primaryColor,

                        fontWeight: FontWeight.bold
                    )
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(
                        "Total Price",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: MyTheme.grey,
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                        )
                    ),
                    Text(
                        "EG ${widget.data.price!*count}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: MyTheme.primaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                        )
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    color: MyTheme.primaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child:Row(
                    children: [
                      Icon(Icons.shopping_cart,color: MyTheme.grey,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            "Add To Cart",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                color: MyTheme.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                            )
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          ],
        ),
      ),
    );
  }
}
