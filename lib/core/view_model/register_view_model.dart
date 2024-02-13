import 'package:get/get.dart';

class RegisterViewModel extends GetxController {
  RxString email = "".obs;

  void updateText(String text) {
    email.value = text;
  }
}
