import 'package:flutter/material.dart';

import '../../../../../core/utils/app_theme.dart';
import '../../../../../core/widgets/custom_text_form_filed.dart';

class SearchBarCustom extends StatelessWidget {
   SearchBarCustom({super.key});
  TextEditingController search=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomTextFormFiled(hintText: 'what do you search for?', controller: search,
            prefixIcon: Icon(Icons.search,color: MyTheme.primaryColor ,),
            BorderColor: MyTheme.primaryColor,
            RadiusSize: 40,
          ),
        ),
        IconButton(onPressed: (){

        }, icon: Icon(Icons.shopping_cart_outlined,color: MyTheme.primaryColor,))
      ],
    );
  }
}
