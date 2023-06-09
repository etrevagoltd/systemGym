// ignore_for_file: camel_case_types, non_constant_identifier_names, unused_import, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:images_picker/images_picker.dart';
import 'package:systemgym/constants/colors.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../data/remote/food_remote.dart';
import '../../../services/pick_image.dart';
import '../../../view/widgets/public/trainer_detail_widgets/top_snackbar.dart';

class Adding_a_diet_controller extends GetxController {
  final FoodRemoteDataSource _foodRemoteDataSource = FoodRemoteDataSource();
  RxBool isLoading = false.obs;

  var IDController = TextEditingController();
  var MealRatingController = TextEditingController();
  var NameOfTheDietController = TextEditingController();
  var NameOfTheDietControllerAr = TextEditingController();
  var DescriptionOfTheDietController = TextEditingController();
  var componentsOfTheDietController = TextEditingController();
  var BeginningOfTheDietTimeController = TextEditingController();
  var EndOfTheDietTimeController = TextEditingController();
  var DietTimeIsOverController = TextEditingController();

  List<String> Diet = [];
  RxnString imagePath = RxnString();

  getAllDiets() {}
  void onItemSave() {
    IDController.clear();
    MealRatingController.clear();
    NameOfTheDietController.clear();
    DescriptionOfTheDietController.clear();
    BeginningOfTheDietTimeController.clear();
    DietTimeIsOverController.clear();

    update();
  }

  initImage() async {
    List<Media>? media = await pickImagefromGallery(Get.context!, 1);
    imagePath.value = media!.first.path;
  }

  Map<String, dynamic> initdData() {
    return {
      'name_en': NameOfTheDietController.text.trim(),
      'name_ar': NameOfTheDietControllerAr.text.trim(),
      'description': DescriptionOfTheDietController.text.trim(),
      'start_time': BeginningOfTheDietTimeController.text.trim(),
      'end_time': EndOfTheDietTimeController.text.trim(),
      'components_of_the_diet': NameOfTheDietController.text.trim(),
      'foodsystem_id': NameOfTheDietController.text.trim(),
      'number': IDController.text.trim(),
      'image_path': imagePath.value,
    };
  }

  addData() async {
    Map<String, dynamic> foodData = initdData();
    final data = await _foodRemoteDataSource.addFood(foodData);
    data.fold((l) => null, (r) {
      onItemSave();
      ShowTopSnackBar("Good job, New diet is added successfully", Get.context!);
    });
  }
}
