import 'dart:io';

import 'package:dro_hometest/core/global/constants/lists.dart';
import 'package:dro_hometest/core/global/extensions/number_extensions.dart';
import 'package:dro_hometest/core/global/widgets/buttons_widgets.dart';
import 'package:dro_hometest/core/global/widgets/cart_list_tile_widget.dart';
import 'package:dro_hometest/core/global/widgets/global_header_widget.dart';
import 'package:dro_hometest/core/global/widgets/global_widgets.dart';
import 'package:dro_hometest/di/injectable.dart';
import 'package:dro_hometest/features/hometest/data/models/drug_model.dart';
import 'package:dro_hometest/features/hometest/domain/entities/cart.dart';
import 'package:dro_hometest/features/hometest/presentation/bloc/home_test_bloc.dart';
import 'package:dro_hometest/features/hometest/presentation/cubit/cart_cubit.dart';
import 'package:dro_hometest/home_test_icon_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int grandTotal = 0;

  @override
  void initState() {
    super.initState();
    setVariables();
  }

  void setVariables() async {
    int gt = 0;
    final cc = getIt<CartCubit>().state;
    final sp = await SharedPreferences.getInstance();

    cc!.map((e) {
      var qt = sp.getInt(e);

      if (qt != null) {
        var itemId = int.parse(e.split("-")[1]);
        var price = getPriceVal(itemId);
        gt = gt + (price.toInt() * qt);
      }
    }).toList();

    setState(() {
      grandTotal = gt;
    });
  }

  double getPriceVal(index) {
    return double.parse(Constants.itemList[index]['price']);
  }

  void updateQuantity(int value, String key, int item) async {
    final sp = await SharedPreferences.getInstance();
    sp.setInt(key, value);
    getIt<HomeTestBloc>()
        .add(ChangeQuantity(key + '-' + item.toString(), value));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocListener<HomeTestBloc, HomeTestState>(
        bloc: getIt<HomeTestBloc>(),
        listener: (context, state) {
          if (state is DeletedCartItem) {
            //update UI
            // setState(() {});
            setVariables();
          }

          if (state is QuantityChanged) {
            setVariables();
          }

          // if(state is )
        },
        child: Column(children: [
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
          if (getIt<CartCubit>().state == null)
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/404.png'),
                  20.verticalGap,
                  const Text(
                    'No item in cart yet',
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
            ),
          if (getIt<CartCubit>().state != null)
            Expanded(
              // height: 500,
              child: ListView.builder(
                  itemCount: getIt<CartCubit>().state == null
                      ? 0
                      : getIt<CartCubit>().state!.length,
                  itemBuilder: (context, index) {
                    final data = getIt<CartCubit>().state![index];
                    int itemId = int.parse(data.split("-")[1]);
                    String cartId = data.split("-")[0];
                    final drug = DrugModel(
                            name: Constants.itemList[itemId]['name'],
                            desc: Constants.itemList[itemId]['desc'],
                            soldBy: Constants.itemList[itemId]['sold_by'],
                            soldByImage: Constants.itemList[itemId]
                                ['sold_by_image'],
                            price: Constants.itemList[itemId]['price'],
                            packSize: Constants.itemList[itemId]['pack_size'],
                            productId: Constants.itemList[itemId]['product_id'],
                            constituents: Constants.itemList[itemId]['const'],
                            dispensedIn: Constants.itemList[itemId]
                                ['dispensed_in'],
                            longDesc: Constants.itemList[itemId]['long_desc'],
                            image: Constants.itemList[itemId]['image'],
                            requiresPres: Constants.itemList[itemId]
                                ['requires_pres'])
                        .toEntity();
                    return CartListTileWidget(
                        image: drug.image,
                        desc: drug.desc,
                        title: drug.name,
                        changeQuantity: (value) {
                          updateQuantity(value, cartId, itemId);
                        },
                        removeItem: () {
                          getIt<HomeTestBloc>().add(DeleteCartItem(Cart(
                              itemId: itemId, cartId: cartId, quantity: 0)));
                        },
                        price: getPrice(data, drug.price),
                        quantity: getQuantity(data));
                  }),
            ),
          // Expanded(child: Container()),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            child: Row(
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      const TextSpan(
                          text: 'Total:', style: TextStyle(fontSize: 18)),
                      TextSpan(
                        text: '  ₦' + grandTotal.toString() + '.00',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ],
                  ),
                ),
                20.horizontalGap,
                Expanded(
                  child: GButtons.purpleGradient('CHECKOUT', () {},
                      showIcon: false),
                )
              ],
            ),
          ),
        ]),
      ),
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
            return GWidgets.blackText('₦' + p.toInt().toString() + '.00',
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
