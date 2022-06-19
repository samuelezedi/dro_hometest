import 'package:dro_hometest/home_test_icon_icons.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.3),
          borderRadius: BorderRadius.circular(10)),
      child: const TextField(
        style: TextStyle(color: Colors.white, fontSize: 18),
        cursorColor: Colors.white,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(0),
            border: InputBorder.none,
            hintText: 'Search',
            hintStyle: TextStyle(color: Colors.white, fontSize: 18),
            prefixIcon: Icon(
              HomeTestIcon.search,
              size: 15,
              color: Colors.white,
            )),
      ),
    );
  }
}
