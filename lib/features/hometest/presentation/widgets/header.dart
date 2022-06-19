import 'package:dro_hometest/core/global/widgets/global_header_widget.dart';
import 'package:dro_hometest/home_test_icon_icons.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Header extends StatelessWidget {
  Header({required this.searchController, this.onChange, Key? key})
      : super(key: key);
  TextEditingController searchController;
  Function(String v)? onChange;

  @override
  Widget build(BuildContext context) {
    return GlobalHeader(
      headerTitle: 'Pharmacy',
      icon: const Icon(
        HomeTestIcon.van,
        color: Colors.white,
        size: 20,
      ),
      showSearchBar: true,
      showLeadingWidget: false,
      searchController: searchController,
      onChange: onChange,
    );
  }
}
