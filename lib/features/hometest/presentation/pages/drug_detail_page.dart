import 'package:dro_hometest/core/global/constants/lists.dart';
import 'package:dro_hometest/core/global/extensions/number_extensions.dart';
import 'package:dro_hometest/core/global/widgets/buttons_widgets.dart';
import 'package:dro_hometest/core/global/widgets/global_header_widget.dart';
import 'package:dro_hometest/core/global/widgets/global_widgets.dart';
import 'package:dro_hometest/core/global/widgets/item_widget.dart';
import 'package:dro_hometest/di/injectable.dart';
import 'package:dro_hometest/features/hometest/data/models/cart_model.dart';
import 'package:dro_hometest/features/hometest/data/models/drug_model.dart';
import 'package:dro_hometest/features/hometest/domain/entities/cart.dart';
import 'package:dro_hometest/features/hometest/domain/entities/drug.dart';
import 'package:dro_hometest/features/hometest/presentation/bloc/home_test_bloc.dart';
import 'package:dro_hometest/features/hometest/presentation/pages/cart_page.dart';
import 'package:dro_hometest/home_test_icon_icons.dart';
import 'package:flutter/material.dart';

class DrugDetailPage extends StatefulWidget {
  const DrugDetailPage({required this.drug, required this.index, Key? key})
      : super(key: key);
  final Drug drug;
  final int index;

  @override
  State<DrugDetailPage> createState() => _DrugDetailPageState();
}

class _DrugDetailPageState extends State<DrugDetailPage> {
  int quantity = 1;
  double price = 0;
  double showPrice = 0;

  @override
  void initState() {
    super.initState();

    price = double.parse(widget.drug.price.toString());
    showPrice = double.parse(widget.drug.price.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(children: [
                GlobalHeader(
                  headerTitle: 'Pharmacy',
                  searchController: TextEditingController(),
                  icon: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CartPage()));
                      },
                      icon: const Icon(
                        HomeTestIcon.cart,
                        size: 20,
                        color: Colors.white,
                      )),
                ),
                20.verticalGap,
                Image.asset(
                  widget.drug.image,
                  height: 170,
                ),
                10.verticalGap,
                GWidgets.blackText(widget.drug.name),
                10.verticalGap,
                GWidgets.greyText(widget.drug.desc, opacity: 0.5, fontSize: 18),
                20.verticalGap,
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 35),
                  dense: true,
                  leading: Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        border: Border.all(
                            color: const Color(0xFF828282).withOpacity(0.3),
                            width: 1),
                        image: DecorationImage(
                            image: AssetImage(widget.drug.soldByImage),
                            fit: BoxFit.cover)),
                  ),
                  title: const Text(
                    'SOLD BY',
                    style: TextStyle(color: Color(0xFF8EA5BC), fontSize: 10),
                  ),
                  subtitle: Text(
                    widget.drug.soldBy,
                    style: const TextStyle(
                        color: Color(0xFF13447A),
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  trailing: Container(
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
                  ),
                ),
                10.verticalGap,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 15),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color:
                                    const Color(0xFF828282).withOpacity(0.3)),
                            borderRadius: BorderRadius.circular(15)),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                  onTap: () {
                                    if (quantity > 1) {
                                      setState(() {
                                        quantity -= 1;
                                        showPrice = price * quantity;
                                      });
                                    }
                                  },
                                  child: GWidgets.blackText('-')),
                              25.horizontalGap,
                              GWidgets.blackText(quantity.toString()),
                              25.horizontalGap,
                              InkWell(
                                  onTap: () {
                                    setState(() {
                                      quantity += 1;
                                      showPrice = price * quantity;
                                    });
                                  },
                                  child: GWidgets.blackText('+')),
                            ]),
                      ),
                      10.horizontalGap,
                      GWidgets.greyText('Pack(s)', opacity: 0.5),
                      Expanded(
                        child: Container(),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: GWidgets.blackText('₦',
                              fontWeight: FontWeight.normal, fontSize: 17)),
                      GWidgets.blackText(showPrice.toInt().toString(),
                          fontSize: 30),
                      Padding(
                          padding: const EdgeInsets.only(top: 6),
                          child: GWidgets.blackText('.00',
                              fontWeight: FontWeight.bold, fontSize: 20)),
                    ],
                  ),
                ),
                20.verticalGap,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: Row(
                    children: [
                      GWidgets.blueText('PRODUCT DETAILS',
                          fontWeight: FontWeight.bold),
                    ],
                  ),
                ),
                5.verticalGap,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: Row(
                    children: [
                      Expanded(
                        child: ListTile(
                          dense: true,
                          leading: const Icon(
                            HomeTestIcon.pills,
                            color: Color(0xFF9F5DE2),
                            size: 30,
                          ),
                          title: GWidgets.blueText('PACK SIZE',
                              fontSize: 10, opacity: 0.5),
                          subtitle: GWidgets.blueText(widget.drug.packSize,
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          dense: true,
                          leading: const Icon(
                            HomeTestIcon.list,
                            color: Color(0xFF9F5DE2),
                            size: 30,
                          ),
                          title: GWidgets.blueText('PRODUCT ID',
                              fontSize: 10, opacity: 0.5),
                          subtitle: GWidgets.blueText(widget.drug.productId,
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: Row(
                    children: [
                      Expanded(
                        child: ListTile(
                          dense: true,
                          leading: const Icon(
                            HomeTestIcon.pill,
                            color: Color(0xFF9F5DE2),
                            size: 30,
                          ),
                          title: GWidgets.blueText('CONSTITUENTS',
                              fontSize: 10, opacity: 0.5),
                          subtitle: GWidgets.blueText(widget.drug.constituents,
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          dense: true,
                          leading: const Icon(
                            HomeTestIcon.cup,
                            color: Color(0xFF9F5DE2),
                            size: 30,
                          ),
                          title: GWidgets.blueText('DISPENED IN',
                              fontSize: 10, opacity: 0.5),
                          subtitle: GWidgets.blueText(widget.drug.dispensedIn,
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
                20.verticalGap,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: GWidgets.greyText(widget.drug.longDesc, opacity: 0.8),
                ),
                20.verticalGap,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    children: [
                      GWidgets.greyText('Similar Products',
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ],
                  ),
                ),
                15.verticalGap,
                Container(
                  height: 300,
                  margin: const EdgeInsets.only(left: 25),
                  child: ListView.separated(
                      separatorBuilder: (context, index) {
                        return 20.horizontalGap;
                      },
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: Constants.itemList.length,
                      itemBuilder: (context, index) {
                        final Drug drug =
                            DrugModel.fromJson(Constants.itemList[index])
                                .toEntity();
                        return SizedBox(
                          width: 200,
                          child: ItemWidget(
                            imageUrl: drug.image,
                            title: drug.name,
                            desc: drug.desc,
                            priceTag: drug.price,
                            requiredPres: drug.requiresPres,
                          ),
                        );
                      }),
                )
              ]),
            ),
          ),
          Container(
              padding: const EdgeInsets.only(
                  left: 25, right: 25, bottom: 25, top: 25),
              color: Colors.white,
              child: GButtons.purpleGradient('Add to cart', () {
                Cart cart = CartModel(
                        itemId: widget.index,
                        cartId: "${widget.index}**cartID",
                        quantity: quantity)
                    .toEntity();
                getIt<HomeTestBloc>().add(AddCartItem(cart));

                GWidgets.showBottomSheet(context,
                    '${widget.drug.name} has been successfully added to cart!',
                    continueShopping: () {
                  Navigator.pop(context);
                }, viewCart: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CartPage()));
                });
              }))
        ],
      ),
    );
  }
}
