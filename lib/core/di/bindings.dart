// import 'package:get_it/get_it.dart';
// import 'package:mvvm_evaluation_task/core/repositories/api_repository.dart';
// import 'package:mvvm_evaluation_task/core/view_model/home_view_model.dart';
// import 'package:mvvm_evaluation_task/core/view_model/doctor_view_model.dart';

// final locator = GetIt.instance;

// void setUpLocator() {
//   locator.registerLazySingleton(() => ApiRepository());
//   locator.registerLazySingleton(() => HomeViewModel());
//   locator.registerLazySingleton(() => DoctorViewModel());
// }

import 'package:get/get.dart';
import 'package:getx_food_app/core/repositories/api_repository.dart';
import 'package:getx_food_app/core/view_model/home_view_model.dart';
import 'package:getx_food_app/core/view_model/sign_in_sign_up_view_model.dart';
class AppBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ApiRepository());
    Get.put(HomeViewModel());
    Get.put(SignInSignUpViewModel());
  }
}
