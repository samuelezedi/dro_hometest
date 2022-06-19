import 'package:dro_hometest/core/global/extensions/number_extensions.dart';
import 'package:dro_hometest/core/global/widgets/item_widget.dart';
import 'package:dro_hometest/features/hometest/data/models/drug_model.dart';
import 'package:dro_hometest/features/hometest/domain/entities/drug.dart';
import 'package:dro_hometest/features/hometest/presentation/pages/drug_detail_page.dart';
import 'package:flutter/material.dart';

class SearchResult extends StatelessWidget {
  const SearchResult(
      {required this.list,
      required this.searchNotFound,
      required this.searchText,
      Key? key})
      : super(key: key);
  final List list;
  final bool searchNotFound;
  final String searchText;

  @override
  Widget build(BuildContext context) {
    return list.isEmpty
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/404.png'),
              20.verticalGap,
              Text(
                'No result found for "$searchText"',
                style: const TextStyle(fontSize: 20),
              )
            ],
          )
        : Padding(
            padding: const EdgeInsets.all(24),
            child: GridView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisExtent: 290, crossAxisSpacing: 30),
              itemBuilder: (_, index) {
                final Drug drug = DrugModel.fromJson(list[index]).toEntity();
                return ItemWidget(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DrugDetailPage(
                                  drug: drug,
                                )));
                  },
                  showShadow: false,
                  imageUrl: drug.image.toString(),
                  title: drug.name.toString(),
                  desc: drug.desc.toString(),
                  priceTag: drug.price.toString(),
                  showBorder: true,
                  showAddToCart: true,
                  requiredPres: drug.requiresPres,
                );
              },
              itemCount: list.length,
              // padding: const EdgeInsets.all(20),
            ),
          );
  }
}
