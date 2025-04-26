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
  @override
  void dispose() {

    super.dispose();
  }
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<HomeCubit>(context).getAllCategories();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
  builder: (context, state) {
    if(state is HomeSuccess){
     var data=BlocProvider.of<HomeCubit>(context).categoryDataList;
      return Container(
        height: 300,
        child: GridView.builder(
          scrollDirection: Axis.horizontal,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,

          ),
          itemCount: data!.length,
          padding: const EdgeInsets.symmetric(vertical: 10),
          itemBuilder: (BuildContext context, int index) {
            return  Column(
              children: [
                Container(
                  width: 100,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(70),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(70),
                    child: Image.network(
                      data[index].image!,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey[300],
                          child: Icon(Icons.broken_image),
                        );
                      },
                    ),
                  ),
                ),
                Center(
                  child: Text(
                      textAlign: TextAlign.center,
                      data[index].name!,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: MyTheme.primaryColor
                      )),
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
