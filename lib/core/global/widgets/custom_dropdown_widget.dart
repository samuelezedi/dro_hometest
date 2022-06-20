import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomDropdownWidget extends StatelessWidget {
  CustomDropdownWidget(
      {required this.icon,
      required this.selected,
      required this.controller,
      required this.onChange,
      Key? key})
      : super(key: key);
  final Widget icon;
  final Widget selected;
  final Function(String x) onChange;

  CustomPopupMenuController controller;

  @override
  Widget build(BuildContext context) {
    return CustomPopupMenu(
      child: Row(
        children: [
          selected,
          Container(
            child: icon,
            padding: EdgeInsets.zero,
          ),
        ],
      ),
      menuBuilder: () => ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Container(
          color: const Color(0xFF4C4C4C),
          child: IntrinsicWidth(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [1, 2, 3, 4, 5, 6, 7, 8]
                  .map(
                    (item) => InkWell(
                      onTap: () {
                        print('here');

                        onChange(item.toString());
                      },
                      child: Container(
                        height: 40,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        color: Colors.white,
                        child: Container(
                          margin: const EdgeInsets.only(left: 7, right: 7),
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            item.toString(),
                            style: const TextStyle(
                                fontSize: 14, color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ),
      pressType: PressType.singleClick,
      verticalMargin: -10,
      controller: controller,
    );
  }
}
