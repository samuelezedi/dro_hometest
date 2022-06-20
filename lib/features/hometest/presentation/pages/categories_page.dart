import 'package:dro_hometest/core/global/constants/lists.dart';
import 'package:dro_hometest/core/global/extensions/number_extensions.dart';
import 'package:dro_hometest/core/global/widgets/category_widget.dart';
import 'package:dro_hometest/core/global/widgets/global_header_widget.dart';
import 'package:dro_hometest/features/hometest/presentation/pages/cart_page.dart';
import 'package:dro_hometest/home_test_icon_icons.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          GlobalHeader(
            searchController: TextEditingController(),
            headerTitle: 'Categories',
            icon: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const CartPage()));
              },
              icon: const Icon(
                HomeTestIcon.cart,
                size: 20,
                color: Colors.white,
              ),
            ),
          ),
          25.verticalGap,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: GridView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 120,
                  crossAxisSpacing: 30,
                  mainAxisSpacing: 20),
              itemBuilder: (_, index) {
                return CategoryWidget(
                  imageUrl: Constants.categoryList[index]['image'].toString(),
                  title: Constants.categoryList[index]['name'].toString(),
                );
              },
              itemCount: Constants.categoryList.length,
              // padding: const EdgeInsets.all(20),
            ),
          ),
        ],
      ),
    );
  }
}
