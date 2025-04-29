import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_theme.dart';
import '../../cubit/Home_cubit.dart';
import 'Image_Container.dart';

class CustomBrandList extends StatefulWidget {
  const CustomBrandList({super.key});

  @override
  State<CustomBrandList> createState() => _CustomBrandListState();
}

class _CustomBrandListState extends State<CustomBrandList> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeCubit>(context).getAllBrand();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeSuccess) {
          var data = BlocProvider.of<HomeCubit>(context).brandDataList;
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
                    ClipOval(
                      child: Image.network(
                        data[index].image!,
                        width: 100,
                        height: 100,
                        fit: BoxFit.contain,
                        errorBuilder:
                            (context, error, stackTrace) => Icon(Icons.error),
                      ),
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
