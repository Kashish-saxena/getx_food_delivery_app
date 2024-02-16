import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_food_app/core/constants/string_constants.dart';
import 'package:getx_food_app/core/enums/view_state.dart';
import 'package:getx_food_app/core/models/signup_request_model.dart';
import 'package:getx_food_app/core/persistence/get_storage.dart';
import 'package:getx_food_app/core/repositories/api_repository.dart';
import 'package:getx_food_app/ui/views/home_screen.dart';

class SignInSignUpViewModel extends GetxController {
  final GlobalKey<FormState> registerKey = GlobalKey<FormState>();
  var registerName = ''.obs;
  var registerEmail = ''.obs;
  var registerGender = ''.obs;
  var registerStatus = ''.obs;
  var registerPassword = ''.obs;
  var registerConfirmPassword = ''.obs;
  var loginEmail = "".obs;
  var loginPassword = "".obs;
  var state = ViewState.busy;
  GetStorageBox storage = GetStorageBox.storage;
  final List<String> gender = ["male", "female"];
  String? select = "male";
  void onClickRadioButton(value) {
    log(value);
    select = value;
    update();
  }
  final ApiRepository apiRepository = Get.find();
  final userLoading = false.obs;
  Future<void> postUser(SignUpRequestModel signUpRequestModel) async {
    userLoading.value = true;
    Response response = await apiRepository.create(signUpRequestModel);
    try {
      if (response.statusCode == 201) {
        state = ViewState.idle;
        storage.setEmail(storage.email, registerEmail.value);
        storage.setPassword(storage.email, registerPassword.value);

        Get.snackbar(StringConstants.registerConfirmation,
            StringConstants.userRegistered);
      }
      if (response.statusCode == 422) {
        Get.snackbar(
            StringConstants.registerConfirmation, StringConstants.alreadyExist);
      } else {
        Get.snackbar(StringConstants.registerConfirmation,
            StringConstants.userNotRegistered);
        state = ViewState.idle;
      }
    } catch (e) {
      Get.snackbar(StringConstants.registerConfirmation, e.toString());
      state = ViewState.idle;
    }
    state = ViewState.idle;
  }

  void setEmail(String email) {
    registerEmail.value = email;
  }

  void setPassword(String password) {
    registerPassword.value = password;
  }

  void setConfirmPassword(String password) {
    registerConfirmPassword.value = password;
  }

  bool checkEmail(String email) {
    if (loginEmail.value == email) {
      return true;
    } else {
      return false;
    }
  }

  bool checkPassword(String password) {
    if (loginPassword.value == password) {
      return true;
    } else {
      return false;
    }
  }

  void validateLogin() {
    var email = storage.getEmail(storage.email);

    var password = storage.getPassword(storage.password);
    if (loginEmail.value.isEmpty && loginPassword.value.isEmpty) {
      Get.snackbar(
          StringConstants.loginConfirmation, StringConstants.enterloginDetails);
    }
    checkEmail(email) && checkPassword(password)
        ? Get.to(() => HomeScreen())
        : Get.snackbar(StringConstants.loginConfirmation,
            StringConstants.enterloginCorrectDetails);
  }
}


// Future postData(
  //     BuildContext context, SignUpRequestModel signUpRequestModel) async {
  //   var res = await apiRepository.postData(signUpRequestModel);

  //   try {
  //     if (res == 201) {
  //       state = ViewState.idle;

  //       box.write("email", registerEmail.value);
  //       box.write("password", registerPassword.value);

  //       Get.snackbar(StringConstants.registerConfirmation,
  //           StringConstants.userRegistered);
  //     }
  //     if (res == 422) {
  //       Get.snackbar(
  //           StringConstants.registerConfirmation, StringConstants.alreadyExist);
  //     } else {
  //       Get.snackbar(StringConstants.registerConfirmation,
  //           StringConstants.userNotRegistered);
  //       state = ViewState.idle;
  //     }
  //   } catch (e) {
  //     Get.snackbar(StringConstants.registerConfirmation, e.toString());
  //     state = ViewState.idle;
  //   }
  //   state = ViewState.idle;
  // }