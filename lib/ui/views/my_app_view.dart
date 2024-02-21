import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:getx_food_app/core/di/bindings.dart';
import 'package:getx_food_app/core/routing/routes.dart';
import '../../core/routing/router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  

  @override
  Widget build(BuildContext context) {
    
    return GetMaterialApp(
      
      initialBinding: AppBindings(),
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.welcomeScreen,
      onGenerateRoute: PageRoutes.generateRoutes,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
