import 'dart:io';

import 'package:dro_hometest/core/global/constants/lists.dart';
import 'package:dro_hometest/core/global/extensions/number_extensions.dart';
import 'package:dro_hometest/core/global/widgets/cart_list_tile_widget.dart';
import 'package:dro_hometest/core/global/widgets/global_header_widget.dart';
import 'package:dro_hometest/core/global/widgets/global_widgets.dart';
import 'package:dro_hometest/di/injectable.dart';
import 'package:dro_hometest/features/hometest/data/models/cart_model.dart';
import 'package:dro_hometest/features/hometest/data/models/drug_model.dart';
import 'package:dro_hometest/features/hometest/presentation/cubit/cart_cubit.dart';
import 'package:dro_hometest/home_test_icon_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
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
        Container(
          height: 500,
          child: ListView.builder(
              itemCount: getIt<CartCubit>().state == null
                  ? 0
                  : getIt<CartCubit>().state!.length,
              itemBuilder: (context, index) {
                final data = getIt<CartCubit>().state![index];
                int itemId = int.parse(data.split("-")[1]);
                final cart = DrugModel(
                        name: Constants.itemList[itemId]['name'],
                        desc: Constants.itemList[itemId]['desc'],
                        soldBy: Constants.itemList[itemId]['sold_by'],
                        soldByImage: Constants.itemList[itemId]
                            ['sold_by_image'],
                        price: Constants.itemList[itemId]['price'],
                        packSize: Constants.itemList[itemId]['pack_size'],
                        productId: Constants.itemList[itemId]['product_id'],
                        constituents: Constants.itemList[itemId]['const'],
                        dispensedIn: Constants.itemList[itemId]['dispensed_in'],
                        longDesc: Constants.itemList[itemId]['long_desc'],
                        image: Constants.itemList[itemId]['image'],
                        requiresPres: Constants.itemList[itemId]
                            ['requires_pres'])
                    .toEntity();
                return CartListTileWidget(
                    image: cart.image,
                    desc: cart.desc,
                    title: cart.name,
                    changeQuantity: () {},
                    removeItem: () {},
                    price: getPrice(data, cart.price),
                    quantity: getQuantity(data));
              }),
        )
      ]),
    );
  }

  Widget getQuantity(String key) {
    return FutureBuilder<SharedPreferences>(
        future: SharedPreferences.getInstance(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final value = snapshot.data!.getInt(key);
            return Text(
              value.toString(),
              style: const TextStyle(fontSize: 14),
            );
          } else {
            if (Platform.isIOS) {
              return const CupertinoActivityIndicator();
            } else {
              return const CircularProgressIndicator();
            }
          }
        });
  }

  Widget getPrice(String key, String price) {
    return FutureBuilder<SharedPreferences>(
        future: SharedPreferences.getInstance(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final value = snapshot.data!.getInt(key);
            final p = double.parse(price) * value!.toDouble();
            return GWidgets.blackText('₦' + p.toString(),
                fontSize: 14, fontWeight: FontWeight.w600);
          } else {
            if (Platform.isIOS) {
              return const CupertinoActivityIndicator();
            } else {
              return const CircularProgressIndicator();
            }
          }
        });
  }
}
