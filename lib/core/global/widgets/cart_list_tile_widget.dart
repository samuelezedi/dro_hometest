import 'package:flutter/material.dart';

class CartListTileWidget extends StatelessWidget {
  const CartListTileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          border: Border(
              bottom: BorderSide(
        color: Color(0xFFF2F2F2),
        width: 1,
      ))),
      child: Row(children: []),
    );
  }
}
