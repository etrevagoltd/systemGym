// ignore_for_file: must_be_immutable, camel_case_types, prefer_const_constructors

import 'package:flutter/material.dart';

import '../../../component/app_bars/app_bar.dart';
import '../../../component/my_counter.dart';
import '../../../constants/colors.dart';
import '../../../logic/controllers/public/all_diet_controller.dart';

class All_Diet_Screen extends StatelessWidget {
   All_Diet_Screen({Key? key}) : super(key: key);
   late AllDietController allDietController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(whiteText: "All", yellowText: " employee"),
      body: Container(
        width: double.infinity,
        color: mainColor,
        child: ListView(
          children: [
            const SizedBox(
              height: 70,
            ),
            MyCounter(
                itemsLength: 6,
                id: allDietController.ID,
                name: allDietController.NameOfTheDiet,
                description: allDietController.DescriptionOfTheDiet),
            SizedBox(
              height: 11,
            ),
          ],
        ),
      ),
    );
  }
}
