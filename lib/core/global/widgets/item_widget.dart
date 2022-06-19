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
      this.onTap,
      Key? key})
      : super(key: key);
  final String imageUrl;
  final String title;
  final String desc;
  final String priceTag;
  final String? requiredPres;
  final bool showAddToCart;
  final Function()? onTap;

  @override
  State<ItemWidget> createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
              width: MediaQuery.of(context).size.width,
              height: 127,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
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
          Container(
            padding: const EdgeInsets.only(left: 12, top: 12),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 5,
                  blurRadius: 10,

                  offset: const Offset(0, 2), // changes position of shadow
                ),
              ],
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              GWidgets.greyText(widget.title),
              GWidgets.greyText(widget.desc, fontSize: 14, opacity: 0.4),
              12.verticalGap,
              !widget.showAddToCart
                  ? GWidgets.greyText(widget.priceTag,
                      fontSize: 18, fontWeight: FontWeight.bold)
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GWidgets.greyText(widget.priceTag,
                            fontSize: 18, fontWeight: FontWeight.bold),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(HomeTestIcon.heart))
                      ],
                    ),
              if (widget.showAddToCart) GWidgets.addtoCartButton(),
              20.verticalGap,
            ]),
          )
        ]),
      ),
    );
  }
}
