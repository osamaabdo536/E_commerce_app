import 'package:ecommerce_app/core/utils/app_theme.dart';
import 'package:ecommerce_app/feature/home/presentation/view/widgets/CustomCategoryList.dart';
import 'package:ecommerce_app/feature/home/presentation/view/widgets/SearchBarCustom.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_text_form_filed.dart';
import 'image_slider_widget.dart';

class HomeViewBody extends StatelessWidget {
   const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 4),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              Center(
                child: Text("Shopify",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: MyTheme.primaryColor
                    )),
              ),
              //SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              SearchBarCustom(),
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
                CustomCategoryList(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Home Appliance",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: MyTheme.primaryColor
                    ),
                  ),

                ],
              ),


            ],
          ),
        ),
      ),
    );
  }
}
