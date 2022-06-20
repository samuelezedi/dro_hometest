import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomDropdownWidget extends StatelessWidget {
  const CustomDropdownWidget(
      {required this.icon,
      required this.selected,
      required this.onChange,
      Key? key})
      : super(key: key);
  final Widget icon;
  final Widget selected;
  final Function(String x) onChange;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        onSelected: (value) {
          onChange(value.toString());
        },
        padding: EdgeInsets.zero,
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          selected,
          const Icon(
            Icons.keyboard_arrow_down,
            size: 20,
            color: Colors.deepPurple,
          )
        ]),
        itemBuilder: (context) {
          return [1, 2, 3, 4, 5, 6, 7, 8].map((e) {
            return PopupMenuItem<String>(
              value: e.toString(),
              child: Container(
                  margin: EdgeInsets.zero,
                  padding: EdgeInsets.zero,
                  width: MediaQuery.of(context).size.width,
                  child: Center(child: Text(e.toString()))),
            );
          }).toList();
        }
        // itemBuilder: (context) {
        //   return [1, 2, 3, 4, 5, 6, 7, 8].map((e) {
        //     return PopupMenuItem(
        //       padding: EdgeInsets.zero,
        //       onTap: () {
        //         onChange(e.toString());
        //       },
        //       child: SizedBox(width: 10, child: Text(e.toString())),
        //     );
        //   }).toList();
        // },
        );
  }
}
