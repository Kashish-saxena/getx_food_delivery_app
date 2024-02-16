import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_food_app/core/di/bindings.dart';
import 'package:getx_food_app/ui/views/my_app_view.dart';

void main() async {
  await GetStorage.init();
  AppBindings();
  runApp(const MyApp());
}
