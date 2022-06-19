import 'package:flutter/material.dart';

class GWidgets {
  static LinearGradient linearGradient() {
    return const LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [Colors.purple, Colors.blue]);
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

  static Widget purpleText(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: Color(0xFF9F5DE2),
        fontSize: 16,
      ),
    );
  }

  static Widget addtoCartButton() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xFF9F5DE2)),
      child: const Text('ADD TO CART',
          style: TextStyle(
              color: Color(0xFF9F5DE2),
              fontSize: 13,
              fontWeight: FontWeight.bold)),
    );
  }
}
