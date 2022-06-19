import 'package:dro_hometest/core/global/extensions/number_extensions.dart';
import 'package:dro_hometest/core/global/widgets/global_widgets.dart';
import 'package:dro_hometest/home_test_icon_icons.dart';
import 'package:flutter/material.dart';

class GFloatingActionButton extends StatelessWidget {
  const GFloatingActionButton({required this.cartCount, Key? key})
      : super(key: key);
  final int cartCount;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
        extendedPadding: EdgeInsets.zero,
        backgroundColor: Colors.transparent,
        onPressed: () {},
        label: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 2),
              gradient: GWidgets.linearGradient(),
              borderRadius: BorderRadius.circular(50)),
          child: Row(
            children: [
              const Text(
                'Checkout',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              ),
              7.horizontalGap,
              const Icon(
                HomeTestIcon.cart,
              ),
              10.horizontalGap,
              Container(
                width: 18,
                height: 18,
                child: Center(
                  child: Text(
                    cartCount.toString(),
                    style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                decoration: BoxDecoration(
                    color: const Color(0xFFF2C94C),
                    borderRadius: BorderRadius.circular(18)),
              ),
            ],
          ),
        ));
  }
}