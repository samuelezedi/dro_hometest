import 'package:dro_hometest/home_test_icon_icons.dart';
import 'package:flutter/material.dart';

class GlobalHeader extends StatelessWidget {
  const GlobalHeader({required this.headerTitle, Key? key}) : super(key: key);
  final String headerTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 171,
      child: Stack(
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [Image.asset('assets/images/circles.png')]),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                const SizedBox(height: 80),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      headerTitle,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 22),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        HomeTestIcon.van,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
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
