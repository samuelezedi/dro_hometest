import 'package:dro_hometest/core/global/extensions/number_extensions.dart';
import 'package:dro_hometest/core/global/widgets/search_bar_widget.dart';
import 'package:dro_hometest/home_test_icon_icons.dart';
import 'package:flutter/material.dart';

class GlobalHeader extends StatelessWidget {
  GlobalHeader(
      {required this.headerTitle,
      required this.searchController,
      this.showSearchBar = false,
      this.showLeadingWidget = true,
      this.icon,
      this.onChange,
      Key? key})
      : super(key: key);
  final String headerTitle;
  final bool showSearchBar;
  final bool showLeadingWidget;
  final Widget? icon;
  TextEditingController searchController;
  Function(String v)? onChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: showSearchBar
          ? MediaQuery.of(context).size.height * 0.20
          : MediaQuery.of(context).size.height * 0.15,
      child: Stack(
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [Image.asset('assets/images/circles.png')]),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Column(
              children: [
                40.verticalGap,
                Row(
                  children: [
                    if (showLeadingWidget)
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          HomeTestIcon.back,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    20.horizontalGap,
                    Text(
                      headerTitle,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 22),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: icon ??
                          const Icon(
                            HomeTestIcon.cart,
                            color: Colors.white,
                            size: 20,
                          ),
                    ),
                    15.horizontalGap,
                  ],
                ),
                if (showSearchBar) 10.verticalGap,
                if (showSearchBar)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SearchBar(
                      textController: searchController,
                      onChange: onChange,
                    ),
                  )
              ],
            ),
          )
        ],
      ),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          image: DecorationImage(
              image: AssetImage('assets/images/header_image.png'),
              fit: BoxFit.cover)),
    );
  }
}
