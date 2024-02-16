import 'dart:developer';

import 'package:get/state_manager.dart';

class HomeViewModel extends GetxController {
  RxInt currentIndex = 0.obs;
  void changeIndex(int index) {
    currentIndex.value = index;
    log("index... $index");
  }
}
