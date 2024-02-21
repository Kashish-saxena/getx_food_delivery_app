import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_food_app/core/constants/string_constants.dart';
import 'package:getx_food_app/core/models/signup_request_model.dart';
import 'package:getx_food_app/core/persistence/get_storage.dart';
import 'package:getx_food_app/core/repositories/api_repository.dart';
import 'package:getx_food_app/ui/views/home_screen.dart';
import 'package:getx_food_app/ui/views/sign_in_sign_up_screen.dart';

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
  GetStorageBox storage = GetStorageBox.instance;
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
        storage.setEmail(registerEmail.value);
        storage.setPassword(registerPassword.value);

        Get.snackbar(StringConstants.registerConfirmation,
            StringConstants.userRegistered);
        Get.off(() => SignInSignUpScreen());
      } else if (response.statusCode == 422) {
        Get.snackbar(
            StringConstants.registerConfirmation, "${response.statusCode}---->${StringConstants.alreadyExist}");
      } else if (response.statusCode == 500) {
        Get.snackbar(
            StringConstants.registerConfirmation, "${response.statusCode}---->${StringConstants.alreadyExist}");
      } else {
        Get.snackbar(StringConstants.registerConfirmation,
            "${response.statusCode}---->${StringConstants.userNotRegistered}");
      }
    } catch (e) {
      Get.snackbar(StringConstants.registerConfirmation, e.toString());
    } finally {
      userLoading.value = false;
    }
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
    if (email == "") {
      return false;
    } else if (loginEmail.value == email) {
      return true;
    } else {
      return false;
    }
  }

  bool checkPassword(String password) {
    if (password == "") {
      return false;
    } else if (loginPassword.value == password) {
      return true;
    } else {
      return false;
    }
  }

  void validateLogin() async{
    userLoading.value = true;
    
    try {
      // Future.delayed(Duration(minutes: 1));
      var email = storage.getEmail();
      var password = storage.getPassword();

      if (checkEmail(email) && checkPassword(password)) {
       await Future.delayed(const Duration(seconds: 1), () {
        userLoading.value = true;
        storage.setIsLogin("true");
        Get.off(()=> SignInSignUpScreen());
      });
        Get.off(()=> HomeScreen());
      } else {
        Get.snackbar(StringConstants.loginConfirmation,
            StringConstants.enterloginCorrectDetails);
      }
      
    } catch (e) {
      log("$e");
    } 
    finally{
      userLoading.value=false;
    }
    // if (loginEmail.value.isEmpty && loginPassword.value.isEmpty) {
    //   Get.snackbar(
    //       StringConstants.loginConfirmation, StringConstants.enterloginDetails);
    // }
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
