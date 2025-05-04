import 'package:ecommerce_app/core/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

ClipRRect imageSliderWidget(BuildContext context) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(12),
    child: ImageSlideshow(
      width: double.infinity,
      height: MediaQuery.of(context).size.height*0.2,
      initialPage: 0,
      indicatorColor: MyTheme.primaryColor,
      indicatorBackgroundColor: MyTheme.grey,
      autoPlayInterval: 3000,
      isLoop: true,
      children: [
        Image.asset('assets/images/ad1.png', fit: BoxFit.cover),
        Image.asset('assets/images/ad2.png', fit: BoxFit.cover),
        Image.asset('assets/images/ad3.png', fit: BoxFit.cover),
      ],
    ),
  );
}