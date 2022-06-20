import 'package:dro_hometest/core/global/constants/lists.dart';
import 'package:dro_hometest/core/global/extensions/number_extensions.dart';
import 'package:dro_hometest/core/global/widgets/category_widget.dart';
import 'package:dro_hometest/core/global/widgets/global_header_widget.dart';
import 'package:dro_hometest/core/global/widgets/global_widgets.dart';
import 'package:dro_hometest/core/global/widgets/item_widget.dart';
import 'package:dro_hometest/features/hometest/data/models/drug_model.dart';
import 'package:dro_hometest/features/hometest/domain/entities/drug.dart';
import 'package:dro_hometest/features/hometest/presentation/pages/cart_page.dart';
import 'package:dro_hometest/features/hometest/presentation/pages/categories_page.dart';
import 'package:dro_hometest/features/hometest/presentation/pages/drug_detail_page.dart';
import 'package:dro_hometest/home_test_icon_icons.dart';
import 'package:flutter/material.dart';

class LargeCategoryPage extends StatelessWidget {
  const LargeCategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            GlobalHeader(
              searchController: TextEditingController(),
              headerTitle: 'Categories',
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
                ),
              ),
            ),
            25.verticalGap,
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
                SizedBox(
                  height: 98,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      itemCount: Constants.categoryList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 24),
                          child: CategoryWidget(
                            imageUrl: Constants.categoryList[index]['image']
                                .toString(),
                            title: Constants.categoryList[index]['name']
                                .toString(),
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
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisExtent: 250,
                            crossAxisSpacing: 30),
                    itemBuilder: (_, index) {
                      final Drug drug =
                          DrugModel.fromJson(Constants.itemList[index])
                              .toEntity();
                      return ItemWidget(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DrugDetailPage(
                                        drug: drug,
                                        index: index,
                                      )));
                        },
                        imageUrl: drug.image.toString(),
                        title: drug.name.toString(),
                        desc: drug.desc.toString(),
                        priceTag: drug.price.toString(),
                        requiredPres: drug.requiresPres,
                      );
                    },
                    itemCount: Constants.itemList.length,
                    // padding: const EdgeInsets.all(20),
                  ),
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
