import 'package:dro_hometest/core/global/widgets/global_widgets.dart';
import 'package:dro_hometest/home_test_icon_icons.dart';
import 'package:flutter/material.dart';
import '../extensions/number_extensions.dart';

class ItemWidget extends StatefulWidget {
  const ItemWidget(
      {required this.imageUrl,
      required this.title,
      required this.desc,
      required this.priceTag,
      this.requiredPres,
      this.showAddToCart = false,
      Key? key})
      : super(key: key);
  final String imageUrl;
  final String title;
  final String desc;
  final String priceTag;
  final String? requiredPres;
  final bool showAddToCart;

  @override
  State<ItemWidget> createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(children: [
        Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(widget.imageUrl), fit: BoxFit.cover)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (widget.requiredPres != null)
                  Container(
                      decoration:
                          BoxDecoration(color: Colors.black.withOpacity(0.5)),
                      child: Text(widget.requiredPres as String))
              ],
            )),
        12.verticalGap,
        GWidgets.greyText(widget.title),
        5.verticalGap,
        GWidgets.greyText(widget.desc, fontSize: 14, opacity: 0.4),
        15.verticalGap,
        !widget.showAddToCart
            ? GWidgets.greyText(widget.priceTag,
                fontSize: 18, fontWeight: FontWeight.bold)
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GWidgets.greyText(widget.priceTag,
                      fontSize: 18, fontWeight: FontWeight.bold),
                  IconButton(
                      onPressed: () {}, icon: const Icon(HomeTestIcon.heart))
                ],
              ),
        if (widget.showAddToCart) GWidgets.addtoCartButton()
      ]),
    );
  }
}
