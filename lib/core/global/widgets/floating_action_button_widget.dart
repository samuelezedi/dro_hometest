import 'package:dro_hometest/core/global/extensions/number_extensions.dart';
import 'package:dro_hometest/core/global/widgets/global_widgets.dart';
import 'package:dro_hometest/home_test_icon_icons.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class GFloatingActionButton extends StatelessWidget {
  GFloatingActionButton({required this.cartCount, Key? key}) : super(key: key) {
    small = false;
  }
  final int cartCount;
  late bool small;

  GFloatingActionButton.small({required this.cartCount, Key? key})
      : super(key: key) {
    small = true;
  }

  @override
  Widget build(BuildContext context) {
    return small
        ? Stack(
            children: [
              FloatingActionButton.small(
                  onPressed: () {},
                  child: Container(
                    padding: const EdgeInsets.only(right: 5),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 2),
                        gradient: GWidgets.linearGradient(
                            const Color(0xFFFE806F), const Color(0xFFE5366A)),
                        borderRadius: BorderRadius.circular(50)),
                    child: const Align(
                      alignment: Alignment.center,
                      child: Icon(
                        HomeTestIcon.cart,
                        size: 20,
                      ),
                    ),
                  )),
              Positioned(
                left: 28,
                child: Container(
                  width: 18,
                  height: 18,
                  child: Center(
                    child: Text(
                      cartCount.toString(),
                      style: TextStyle(
                          fontSize: 12,
                          color: cartCount == 0
                              ? Colors.transparent
                              : Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: cartCount == 0
                          ? Colors.transparent
                          : const Color(0xFFF2C94C),
                      borderRadius: BorderRadius.circular(18)),
                ),
              )
            ],
          )
        : FloatingActionButton.extended(
            extendedPadding: EdgeInsets.zero,
            backgroundColor: Colors.transparent,
            onPressed: () {},
            label: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 2),
                  gradient: GWidgets.linearGradient(
                      const Color(0xFFFE806F), const Color(0xFFE5366A)),
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
