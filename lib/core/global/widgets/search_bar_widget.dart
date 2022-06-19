import 'package:dro_hometest/home_test_icon_icons.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SearchBar extends StatelessWidget {
  SearchBar({required this.textController, this.onChange, Key? key})
      : super(key: key);
  TextEditingController textController;
  Function(String value)? onChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.3),
          borderRadius: BorderRadius.circular(10)),
      child: TextField(
        controller: textController,
        onChanged: (value) => onChange!(value),
        style: const TextStyle(color: Colors.white, fontSize: 18),
        cursorColor: Colors.white,
        decoration: const InputDecoration(
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
