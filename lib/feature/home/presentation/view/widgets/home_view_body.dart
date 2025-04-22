import 'package:ecommerce_app/core/utils/app_theme.dart';
import 'package:flutter/material.dart';

import 'image_slider_widget.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            imageSliderWidget(context),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Categories",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: MyTheme.primaryColor
                  ),
                ),
                InkWell(
                  onTap: (){},
                  child: Text("view all",
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: MyTheme.primaryColor
                    ),),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
