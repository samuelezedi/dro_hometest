import 'package:dro_hometest/core/global/extensions/number_extensions.dart';
import 'package:dro_hometest/core/global/widgets/global_widgets.dart';
import 'package:dro_hometest/home_test_icon_icons.dart';
import 'package:flutter/material.dart';

class GButtons {
  static Widget purpleGradient(String text, Function() onTap) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Center(
        child: Container(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Icon(
                HomeTestIcon.cart,
                color: Colors.white,
              ),
              6.horizontalGap,
              Text(
                text,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              )
            ]),
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: GWidgets.linearGradient(
                    const Color(0xFF7A08FA), const Color(0xFFAD3BFC)))),
      ),
    );
  }

  static Widget purpleOutlined(String text, Function() onTap) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Center(
        child: Container(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                text,
                style: const TextStyle(
                    color: Color(0xFF7A08FA),
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              )
            ]),
            height: 50,
            decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFF7A08FA), width: 2),
                borderRadius: BorderRadius.circular(10),
                color: Colors.white)),
      ),
    );
  }
}
