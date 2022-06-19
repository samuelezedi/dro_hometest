import 'package:dro_hometest/core/global/widgets/global_header_widget.dart';
import 'package:dro_hometest/home_test_icon_icons.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  Header({required this.searchController, this.onChange, Key? key})
      : super(key: key);
  TextEditingController searchController;
  Function(String v)? onChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      child: Stack(
        children: [
          Positioned(
            top: 153,
            child: Container(
              width: MediaQuery.of(context).size.width,
              color: const Color(0xFFF2F2F2),
              padding: const EdgeInsets.only(left: 24, bottom: 20, top: 50),
              child: Row(
                children: const [
                  Icon(
                    HomeTestIcon.location_pin,
                    size: 15,
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(text: ' Delivery in '),
                        TextSpan(
                          text: 'Lagos, NG',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          GlobalHeader(
            headerTitle: 'Pharmacy',
            showSearchBar: true,
            showLeadingWidget: false,
            searchController: searchController,
            onChange: onChange,
          ),
        ],
      ),
    );
  }
}
