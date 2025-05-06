import 'package:ecommerce_app/feature/cart/presentation/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/app_theme.dart';
import 'cart_item.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Cart",
          style: Theme.of(
            context,
          ).textTheme.titleLarge!.copyWith(color: MyTheme.primaryColor),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state is GetCartSuccess) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: state.getCartEntity.numOfCartItems,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CartItem(
                          data: state.getCartEntity.data!.products![index],
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Total Price",
                            style: Theme.of(context).textTheme.titleMedium!
                                .copyWith(color: MyTheme.black70),
                          ),
                          Text(
                            "EGP ${state.getCartEntity.data!.totalCartPrice}",
                            style: Theme.of(context).textTheme.titleMedium!
                                .copyWith(color: MyTheme.black),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: MyTheme.primaryColor,
                        ),
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.08,
                              ),
                              Text(
                                "Check out",
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.08,
                              ),
                              Icon(Icons.arrow_forward, color: MyTheme.white),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.07),
              ],
            );
          } else {
            return Text("");
          }
        },
      ),
    );
  }
}
