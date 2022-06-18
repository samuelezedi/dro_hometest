import 'package:dro_hometest/core/global/widgets/global_header_widget.dart';
import 'package:flutter/material.dart';

class PharmacyPage extends StatelessWidget {
  static const pageRoute = '/pharmacy';
  const PharmacyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: const [
        GlobalHeader(
          headerTitle: 'Pharmacy',
        )
      ]),
    );
  }
}
