import 'package:flutter/material.dart';

import '../../../domain/entity/home_entity.dart';

class Image_container extends StatelessWidget {
  Image_container({super.key,required this.category});
  DataEntity category;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){

      },
      child: Container(
        margin: EdgeInsets.all(8),
        height: 100,
        width: 200,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(category.image!),
            fit: BoxFit.fill,
          ),
        ),
        child: Container(
            alignment: Alignment.center,
            color: Colors.black.withOpacity(0.4),
        )
      ),
    );
  }
}