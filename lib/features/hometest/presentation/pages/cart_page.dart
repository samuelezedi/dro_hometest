import 'package:dro_hometest/core/global/extensions/number_extensions.dart';
import 'package:dro_hometest/core/global/widgets/global_header_widget.dart';
import 'package:dro_hometest/home_test_icon_icons.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
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
        25.verticalGap,
      ]),
    );
  }
}
