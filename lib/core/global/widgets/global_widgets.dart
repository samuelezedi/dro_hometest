import 'package:dro_hometest/core/global/extensions/number_extensions.dart';
import 'package:dro_hometest/core/global/widgets/buttons_widgets.dart';
import 'package:flutter/material.dart';

class GWidgets {
  static LinearGradient linearGradient(Color first, Color second) {
    return LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [first, second]);
  }

  static Widget greyText(String text,
      {double? opacity,
      double fontSize = 16,
      FontWeight fontWeight = FontWeight.normal}) {
    return Text(
      text,
      style: TextStyle(
          color: opacity != null
              ? const Color(0xFF363636).withOpacity(opacity)
              : const Color(0xFF363636),
          fontSize: fontSize,
          fontWeight: fontWeight),
    );
  }

  static Widget blueText(String text,
      {double? opacity,
      double fontSize = 16,
      FontWeight fontWeight = FontWeight.normal}) {
    return Text(
      text,
      style: TextStyle(
          color: opacity != null
              ? const Color(0xFF8EA5BC).withOpacity(opacity)
              : const Color(0xFF8EA5BC),
          fontSize: fontSize,
          fontWeight: fontWeight),
    );
  }

  static Widget blackText(
    String text, {
    double? fontSize,
    FontWeight? fontWeight,
  }) {
    return Text(
      text,
      style: TextStyle(
          color: Colors.black,
          fontSize: fontSize ?? 20,
          fontWeight: fontWeight ?? FontWeight.bold),
    );
  }

  static Widget purpleText(String text,
      {double fontSize = 16, FontWeight fontWeight = FontWeight.normal}) {
    return Text(
      text,
      style: TextStyle(
          color: const Color(0xFF9F5DE2),
          fontSize: fontSize,
          fontWeight: fontWeight),
    );
  }

  static Widget addtoCartButton() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color(0xFF9F5DE2), width: 1.5),
          color: Colors.white),
      child: const Center(
        child: Text('ADD TO CART',
            style: TextStyle(
                color: Color(0xFF9F5DE2),
                fontSize: 13,
                fontWeight: FontWeight.bold)),
      ),
    );
  }

  static void showBottomSheet(BuildContext context, String text) {
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                20.verticalGap,
                Text(text,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.normal)),
                40.verticalGap,
                GButtons.purpleGradient('VIEW CART', () {
                  Navigator.pop(context);
                }),
                15.verticalGap,
                GButtons.purpleOutlined('CONTINUE SHOPPING', () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                }),
                20.verticalGap
              ],
            ),
          );
        });
  }
}
