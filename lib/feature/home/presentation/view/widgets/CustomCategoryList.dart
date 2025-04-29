import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_theme.dart';
import '../../cubit/Home_cubit.dart';

class CustomCategoryList extends StatefulWidget {
  const CustomCategoryList({super.key});

  @override
  State<CustomCategoryList> createState() => _CustomCategoryListState();
}

class _CustomCategoryListState extends State<CustomCategoryList> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeCubit>(context).getAllCategories();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeSuccess) {
          var data = BlocProvider.of<HomeCubit>(context).categoryDataList;
          return SizedBox(
            height: 300,
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: data!.length,
              padding: const EdgeInsets.symmetric(vertical: 10),
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(data[index].image ?? ""),
                      radius: 50,
                    ),
                    SizedBox(height: 8),
                    Center(
                      child: Expanded(
                        child: Text(
                          textAlign: TextAlign.center,
                          textWidthBasis: TextWidthBasis.longestLine,
                          data[index].name!,
                          style: Theme.of(
                            context,
                          ).textTheme.titleSmall!.copyWith(
                            color: MyTheme.primaryColor,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          );
        }
        return Text("");
      },
    );
  }
}
