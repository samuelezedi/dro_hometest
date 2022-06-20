import 'package:dro_hometest/core/global/constants/lists.dart';
import 'package:dro_hometest/core/global/extensions/number_extensions.dart';
import 'package:dro_hometest/core/global/widgets/cart_list_tile_widget.dart';
import 'package:dro_hometest/core/global/widgets/global_header_widget.dart';
import 'package:dro_hometest/di/injectable.dart';
import 'package:dro_hometest/features/hometest/data/models/cart_model.dart';
import 'package:dro_hometest/features/hometest/data/models/drug_model.dart';
import 'package:dro_hometest/features/hometest/presentation/cubit/cart_cubit.dart';
import 'package:dro_hometest/home_test_icon_icons.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getList();
  }

  void getList() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: [
        GlobalHeader(
          searchController: TextEditingController(),
          headerTitle: 'Cart',
          leadingIconShow: true,
          trailingIconShow: false,
          icon: const Icon(
            HomeTestIcon.cart,
            size: 20,
            color: Colors.white,
          ),
        ),
        30.verticalGap,
        ListView.builder(
            itemCount: getIt<CartCubit>().state == null
                ? 0
                : getIt<CartCubit>().state!.length,
            itemBuilder: (context, index) {
              final data = getIt<CartCubit>().state![index];
              final cart = DrugModel(
                      name: Constants.itemList[data.itemId]['name'],
                      desc: Constants.itemList[data.itemId]['desc'],
                      soldBy: Constants.itemList[data.itemId]['sold_by'],
                      soldByImage: Constants.itemList[data.itemId]
                          ['sold_by_image'],
                      price: Constants.itemList[data.itemId]['price'],
                      packSize: Constants.itemList[data.itemId]['pack_size'],
                      productId: Constants.itemList[data.itemId]['product_id'],
                      constituents: Constants.itemList[data.itemId]['const'],
                      dispensedIn: Constants.itemList[data.itemId]
                          ['dispensed_in'],
                      longDesc: Constants.itemList[data.itemId]['long_desc'],
                      image: Constants.itemList[data.itemId]['image'],
                      requiresPres: Constants.itemList[data.itemId]
                          ['required_pres'])
                  .toEntity();
              return CartListTileWidget(
                  image: cart.image,
                  desc: cart.desc,
                  title: cart.name,
                  changeQuantity: () {},
                  price: cart.price,
                  quantity: data.quantity);
            })
      ]),
    );
  }
}
