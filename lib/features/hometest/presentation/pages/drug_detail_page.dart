import 'package:dro_hometest/core/global/widgets/global_header_widget.dart';
import 'package:flutter/material.dart';

class DrugDetailPage extends StatefulWidget {
  const DrugDetailPage({Key? key}) : super(key: key);

  @override
  State<DrugDetailPage> createState() => _DrugDetailPageState();
}

class _DrugDetailPageState extends State<DrugDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        GlobalHeader(
          headerTitle: 'Pharmacy',
          searchController: TextEditingController(),
        )
      ]),
    );
  }
}
