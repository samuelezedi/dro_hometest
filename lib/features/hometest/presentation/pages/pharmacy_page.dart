import 'package:dro_hometest/core/global/constants/lists.dart';
import 'package:dro_hometest/core/global/extensions/number_extensions.dart';
import 'package:dro_hometest/core/global/widgets/buttom_navigation_widget.dart';
import 'package:dro_hometest/core/global/widgets/category_widget.dart';
import 'package:dro_hometest/core/global/widgets/floating_action_button_widget.dart';
import 'package:dro_hometest/core/global/widgets/global_widgets.dart';
import 'package:dro_hometest/core/global/widgets/item_widget.dart';
import 'package:dro_hometest/features/hometest/data/models/drug_model.dart';
import 'package:dro_hometest/features/hometest/domain/entities/drug.dart';
import 'package:dro_hometest/features/hometest/presentation/pages/categories_page.dart';
import 'package:dro_hometest/features/hometest/presentation/pages/drug_detail_page.dart';
import 'package:dro_hometest/features/hometest/presentation/pages/search_result_page.dart';
import 'package:dro_hometest/features/hometest/presentation/widgets/header.dart';
import 'package:flutter/material.dart';

class PharmacyPage extends StatefulWidget {
  const PharmacyPage({Key? key}) : super(key: key);

  @override
  State<PharmacyPage> createState() => _PharmacyPageState();
}

class _PharmacyPageState extends State<PharmacyPage> {
  var tempSearchStore = <Map<String, dynamic>>[];
  TextEditingController searchText = TextEditingController();
  bool showSearching = false;
  bool showSearchNotFound = false;

  void initiateSearch(value) {
    if (value.length == 0) {
      setState(() {
        tempSearchStore = [];
        showSearching = false;
        showSearchNotFound = false;
      });
    } else {
      setState(() {
        showSearching = true;
      });
    }

    tempSearchStore = [];
    // ignore: avoid_function_literals_in_foreach_calls
    Constants.itemList.forEach((element) {
      if (element['name']!.toLowerCase().contains(value.toLowerCase())) {
        setState(() {
          tempSearchStore.add(element);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: GFloatingActionButton.small(
        cartCount: 2,
      ),
      bottomNavigationBar: GBottomNavigation(
        currentIndex: 2,
        onTap: (index) {},
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 150,
        flexibleSpace: Header(
          searchController: searchText,
          onChange: (value) {
            initiateSearch(value);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          showSearching
              ? SearchResult(
                  list: tempSearchStore,
                  searchNotFound: showSearchNotFound,
                  searchText: searchText.text.toString(),
                )
              : Container(
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
                                      builder: (context) =>
                                          const CategoryPage()));
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
        ]),
      ),
    );
  }
}
