import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

import '../../../../core/utils/app_theme.dart';
import 'icon_custom.dart';

class Imageslider extends StatelessWidget {
   Imageslider({super.key, required this.images});
List<String> images;
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.black,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: ImageSlideshow(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.3,
          initialPage: 0,
          indicatorColor: MyTheme.primaryColor,
          indicatorBackgroundColor: MyTheme.grey,
          autoPlayInterval: 3000,
          isLoop: true,
          children: images
              .map((x) => Stack(
                children: [
                  Image.network(
                            x,
                            width: double.infinity,
                            fit: BoxFit.fill,
                          ),
                  Positioned(
                    right: 3,
                    top: 5,
                    child: _buildFavorite(),
                  ),
                ],
              ))
              .toList(),
        ),
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
