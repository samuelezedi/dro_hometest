import 'package:dro_hometest/core/global/extensions/number_extensions.dart';
import 'package:dro_hometest/core/global/widgets/global_widgets.dart';
import 'package:flutter/material.dart';

class CartListTileWidget extends StatelessWidget {
  const CartListTileWidget(
      {required this.image,
      required this.desc,
      required this.title,
      required this.changeQuantity,
      required this.price,
      required this.quantity,
      Key? key})
      : super(key: key);
  final String image;
  final String title;
  final String desc;
  final String price;
  final int quantity;
  final Function() changeQuantity;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          border: Border(
              bottom: BorderSide(
        color: Color(0xFFF2F2F2),
        width: 1,
      ))),
      child: Row(children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
              image:
                  DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
        ),
        15.horizontalGap,
        Column(
          children: [
            GWidgets.blackText(title),
            GWidgets.greyText(desc),
            GWidgets.blackText(price)
          ],
        ),
        15.horizontalGap,
        Column(
          children: [
            Container(
              child: Row(children: [
                GWidgets.greyText(quantity.toString()),
                const Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: Color(0xFF9F5DE2),
                  size: 15,
                )
              ]),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: const Color(0xFF828282).withOpacity(0.3)),
                  borderRadius: BorderRadius.circular(15)),
            ),
          ],
        )
      ]),
    );
  }
}
