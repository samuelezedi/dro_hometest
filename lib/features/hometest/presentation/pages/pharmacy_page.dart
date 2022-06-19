import 'package:dro_hometest/core/global/constants/lists.dart';
import 'package:dro_hometest/core/global/extensions/number_extensions.dart';
import 'package:dro_hometest/core/global/widgets/buttom_navigation_widget.dart';
import 'package:dro_hometest/core/global/widgets/category_widget.dart';
import 'package:dro_hometest/core/global/widgets/floating_action_button_widget.dart';
import 'package:dro_hometest/core/global/widgets/global_header_widget.dart';
import 'package:dro_hometest/core/global/widgets/global_widgets.dart';
import 'package:dro_hometest/core/global/widgets/item_widget.dart';
import 'package:dro_hometest/features/hometest/presentation/pages/categories_page.dart';
import 'package:dro_hometest/features/hometest/presentation/widgets/header.dart';
import 'package:dro_hometest/home_test_icon_icons.dart';
import 'package:flutter/material.dart';

class PharmacyPage extends StatelessWidget {
  static const pageRoute = '/pharmacy';
  PharmacyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: GFloatingActionButton.small(
        cartCount: 2,
      ),
      bottomNavigationBar: GBottomNavigation(
        currentIndex: 1,
        onTap: (index) {},
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(children: [
          const Header(),
          Container(
            color: Colors.white,
            child: Column(children: [
              10.verticalGap,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GWidgets.greyText('CATEGORY',
                        fontWeight: FontWeight.bold, opacity: 0.4),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CategoryPage()));
                      },
                      child: GWidgets.purpleText('VIEW ALL',
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              10.verticalGap,
              Container(
                height: 98,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemCount: Constants.categoryList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 24),
                        child: CategoryWidget(
                          imageUrl:
                              Constants.categoryList[index]['image'].toString(),
                          title:
                              Constants.categoryList[index]['name'].toString(),
                        ),
                      );
                    }),
              ),
              20.verticalGap,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: [
                    GWidgets.greyText('SUGGESTIONS',
                        fontWeight: FontWeight.bold, opacity: 0.4),
                  ],
                ),
              ),
              10.verticalGap,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: GridView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 250,
                      crossAxisSpacing: 30),
                  itemBuilder: (_, index) {
                    return ItemWidget(
                        imageUrl: Constants.itemList[index]['image'].toString(),
                        title: Constants.itemList[index]['name'].toString(),
                        desc: Constants.itemList[index]['desc'].toString(),
                        priceTag:
                            Constants.itemList[index]['price'].toString());
                  },
                  itemCount: Constants.itemList.length,
                  // padding: const EdgeInsets.all(20),
                ),
              ),
            ]),
          )
        ]),
      ),
    );
  }
}
