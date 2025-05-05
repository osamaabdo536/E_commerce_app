import 'package:ecommerce_app/feature/product/domain/entity/get_favourite_entity.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_theme.dart';

class FavouriteItem extends StatelessWidget {
  final FavouriteData data;
  const FavouriteItem({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.14,
          decoration: BoxDecoration(
            color: MyTheme.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: MyTheme.grey,
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(12),
                ),
                child: Image.network(
                  data.imageCover!,
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              // Product details (right side)
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data.subcategory![0].name!,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              color: MyTheme.primaryColor,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Text(
                            data.ratingsAverage.toString(),
                            style: TextStyle(
                              color: MyTheme.primaryColor,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'EGP ${data.price}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: MyTheme.primaryColor,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: MyTheme.primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                              padding: EdgeInsets.symmetric(
                                vertical: 4,
                                horizontal: 8,
                              ),
                            ),
                            child: Text(
                              'Add to Cart',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 5,
          right: 5,
          child: InkWell(
            onTap: (){

            },
              child: Image.asset('assets/images/full_heart.png')
          ),
        ),
      ],
    );
  }
}
