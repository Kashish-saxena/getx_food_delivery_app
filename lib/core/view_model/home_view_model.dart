import 'dart:developer';

import 'package:get/state_manager.dart';
import 'package:getx_food_app/core/persistence/get_storage.dart';

class HomeViewModel extends GetxController {
  GetStorageBox storage = GetStorageBox.instance;
  RxInt currentIndex = 0.obs;
  void changeIndex(int index) {
    currentIndex.value = index;
    log("index... $index");
  }

  removeUser() {
    storage.removeData();
  }
}
