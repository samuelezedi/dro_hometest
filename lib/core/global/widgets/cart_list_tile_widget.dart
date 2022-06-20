import 'package:dro_hometest/core/global/extensions/number_extensions.dart';
import 'package:dro_hometest/core/global/widgets/global_widgets.dart';
import 'package:dro_hometest/home_test_icon_icons.dart';
import 'package:flutter/material.dart';

class CartListTileWidget extends StatelessWidget {
  const CartListTileWidget(
      {required this.image,
      required this.desc,
      required this.title,
      required this.changeQuantity,
      required this.removeItem,
      required this.price,
      required this.quantity,
      Key? key})
      : super(key: key);
  final String image;
  final String title;
  final String desc;
  final Widget price;
  final Widget quantity;
  final Function() changeQuantity;
  final Function() removeItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: const BoxDecoration(
          border: Border(
              bottom: BorderSide(
        color: Color(0xFFF2F2F2),
        width: 1,
      ))),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
              image:
                  DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
        ),
        15.horizontalGap,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GWidgets.blackText(title,
                fontSize: 16, fontWeight: FontWeight.normal),
            7.verticalGap,
            GWidgets.greyText(desc,
                fontSize: 14, fontWeight: FontWeight.normal),
            7.verticalGap,
            price
          ],
        ),
        Expanded(child: Container()),
        Column(
          children: [
            Container(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: quantity,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 5, right: 0),
                      child: Icon(
                        Icons.keyboard_arrow_down_outlined,
                        color: Color(0xFF9F5DE2),
                        size: 20,
                      ),
                    )
                  ]),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: const Color(0xFF828282).withOpacity(0.3)),
                  borderRadius: BorderRadius.circular(7)),
            ),
            20.verticalGap,
            InkWell(
              onTap: () {
                removeItem();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(HomeTestIcon.delete,
                      color: Color(0xFF9F5DE2), size: 15),
                  5.horizontalGap,
                  const Text(
                    'Remove',
                    style: TextStyle(fontSize: 12, color: Color(0xFF9F5DE2)),
                  )
                ],
              ),
            )
          ],
        )
      ]),
    );
  }
}
