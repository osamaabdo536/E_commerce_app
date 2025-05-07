import 'package:flutter/material.dart';

import '../../../../core/utils/app_theme.dart';

class SessionTile extends StatelessWidget {
  final String title;
  final String info;

  SessionTile({required this.title, required this.info});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        dividerColor: Colors.transparent, // Remove inner lines
      ),
      child: ExpansionTile(
        title: Text(title, style: Theme.of(context).textTheme.titleSmall!.copyWith(
            color: MyTheme.primaryColor,

        ),),
        initiallyExpanded: true,
        expandedAlignment: Alignment.topLeft,
        tilePadding: EdgeInsets.all(0),
        childrenPadding: EdgeInsets.symmetric(horizontal: 7.0, vertical: 0),
        iconColor: Colors.black,
        children: [
          Text(info,style: Theme.of(context).textTheme.titleSmall!.copyWith(
          color: MyTheme.black,
            fontSize: 16
          )),
        ],
      ),
    );
  }
}