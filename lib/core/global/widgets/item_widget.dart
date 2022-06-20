import 'package:dro_hometest/core/global/widgets/global_widgets.dart';
import 'package:flutter/material.dart';
import '../extensions/number_extensions.dart';

class ItemWidget extends StatefulWidget {
  const ItemWidget(
      {required this.imageUrl,
      required this.title,
      required this.desc,
      required this.priceTag,
      required this.requiredPres,
      this.showAddToCart = false,
      this.showBorder = false,
      this.onTap,
      this.showShadow = true,
      Key? key})
      : super(key: key);
  final String imageUrl;
  final String title;
  final String desc;
  final String priceTag;
  final bool requiredPres;
  final bool showAddToCart;
  final Function()? onTap;
  final bool showBorder;
  final bool showShadow;

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
            border: Border.all(
                color: const Color(0xFFF2F2F2),
                width: widget.showBorder ? 1 : 0)),
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
                  if (widget.requiredPres)
                    Container(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        width: MediaQuery.of(context).size.width,
                        decoration:
                            BoxDecoration(color: Colors.black.withOpacity(0.5)),
                        child: const Center(
                          child: Text(
                            'Requires a prescription',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ))
                ],
              )),
          Container(
            padding: const EdgeInsets.only(left: 12, top: 12, right: 12),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              // border: Border.all(
              //     color: const Color(0xFFF2F2F2),
              //     width: widget.showBorder ? 1 : 0),
              color: Colors.white,
              boxShadow: [
                if (widget.showShadow)
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
                        GWidgets.greyText('₦' + widget.priceTag,
                            fontSize: 18, fontWeight: FontWeight.bold),
                        Container(
                          height: 32,
                          width: 32,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color(0xFF9F5DE2).withOpacity(0.2),
                          ),
                          child: const Center(
                              child: Icon(
                            Icons.favorite_border,
                            color: Color(0xFF9F5DE2),
                            size: 18,
                          )),
                        )
                      ],
                    ),
              10.verticalGap,
              if (widget.showAddToCart) GWidgets.addtoCartButton(),
              20.verticalGap,
            ]),
          )
        ]),
      ),
    );
  }
}
