import 'package:flutter/material.dart';

class GlobalHeader extends StatelessWidget {
  const GlobalHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [Image.asset('assets/circles.png')]),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          image: DecorationImage(
              image: AssetImage('assets/header_image.png'), fit: BoxFit.cover)),
    );
  }
}
