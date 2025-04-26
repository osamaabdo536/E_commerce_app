import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    // TODO: implement initState
    super.initState();
    BlocProvider.of<HomeCubit>(context).getAllBrand();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if(state is HomeSuccess){
          var data=BlocProvider.of<HomeCubit>(context).brandDataList;
          return Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
                itemCount: data!.length,
                itemBuilder: (context, index) {
              return Image_container(category: data[index],);
            }),
          );
        }
        return Text("");
      },
    );
  }
}
