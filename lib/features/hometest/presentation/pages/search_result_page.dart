import 'package:dro_hometest/core/global/widgets/item_widget.dart';
import 'package:flutter/material.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({required this.list, Key? key}) : super(key: key);
  final List list;

  @override
  Widget build(BuildContext context) {
    return list.isEmpty
        ? Container(
            child: Text('Searching'),
          )
        : GridView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisExtent: 250, crossAxisSpacing: 30),
            itemBuilder: (_, index) {
              return ItemWidget(
                  imageUrl: list[index]['image'].toString(),
                  title: list[index]['name'].toString(),
                  desc: list[index]['desc'].toString(),
                  priceTag: list[index]['price'].toString());
            },
            itemCount: list.length,
            // padding: const EdgeInsets.all(20),
          );
  }
}
