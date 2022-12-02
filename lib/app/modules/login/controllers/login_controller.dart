import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final focusList = [].obs;
  final controllerList = [].obs;

  final count = 0.obs;
  @override
  void onInit() {
    List.generate(3, (index) {
      focusList.add(FocusNode());
      controllerList.add(TextEditingController());
    });

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
