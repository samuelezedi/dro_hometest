import 'package:dro_hometest/core/global/extensions/number_extensions.dart';
import 'package:dro_hometest/core/global/widgets/buttom_navigation_widget.dart';
import 'package:dro_hometest/core/global/widgets/category_widget.dart';
import 'package:dro_hometest/core/global/widgets/floating_action_button_widget.dart';
import 'package:dro_hometest/core/global/widgets/global_header_widget.dart';
import 'package:dro_hometest/core/global/widgets/global_widgets.dart';
import 'package:dro_hometest/core/global/widgets/item_widget.dart';
import 'package:dro_hometest/features/hometest/presentation/widgets/header.dart';
import 'package:dro_hometest/home_test_icon_icons.dart';
import 'package:flutter/material.dart';

class PharmacyPage extends StatelessWidget {
  static const pageRoute = '/pharmacy';
  PharmacyPage({Key? key}) : super(key: key);

  final categoryList = <Map<String, String>>[
    {'name': 'Headache', 'image': 'assets/images/headache.jpeg'},
    {'name': 'Supplements', 'image': 'assets/images/supplement.jpeg'},
    {'name': 'Infants', 'image': 'assets/images/infants.jpeg'},
    {'name': 'Headache', 'image': 'assets/images/headache.jpeg'},
    {'name': 'Supplements', 'image': 'assets/images/supplement.jpeg'},
    {'name': 'Infants', 'image': 'assets/images/infants.jpeg'},
  ];

  final itemList = <Map<String, String>>[
    {
      'name': 'Paracetamol',
      'image': 'assets/images/paracetamol1.jpeg',
      'desc': 'Table 500mg',
      'price': 'N350.00'
    },
    {
      'name': 'Doliprane',
      'image': 'assets/images/doliprane.jpeg',
      'desc': 'Capsule 1000mg',
      'price': 'N350.00'
    },
    {
      'name': 'Paracetamol',
      'image': 'assets/images/paracetamol2.jpeg',
      'desc': 'Table 500mg',
      'price': 'N350.00'
    },
    {
      'name': 'Ibuprofen',
      'image': 'assets/images/ibuprofen.jpeg',
      'desc': 'Table 500mg',
      'price': 'N350.00'
    },
    {
      'name': 'Panadol',
      'image': 'assets/images/panadol.jpeg',
      'desc': 'Table 400mg',
      'price': 'N350.00'
    },
    {
      'name': 'Ibuprofen',
      'image': 'assets/images/ibupro.png',
      'desc': 'Table 500mg',
      'price': 'N350.00'
    },
  ];

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
                    GWidgets.purpleText('VIEW ALL',
                        fontWeight: FontWeight.bold),
                  ],
                ),
              ),
              10.verticalGap,
              Container(
                height: 98,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemCount: categoryList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 24),
                        child: CategoryWidget(
                          imageUrl: categoryList[index]['image'].toString(),
                          title: categoryList[index]['name'].toString(),
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
                        imageUrl: itemList[index]['image'].toString(),
                        title: itemList[index]['name'].toString(),
                        desc: itemList[index]['desc'].toString(),
                        priceTag: itemList[index]['price'].toString());
                  },
                  itemCount: itemList.length,
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
