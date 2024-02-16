import 'package:flutter/material.dart';
import 'package:getx_food_app/core/models/food_menu_model.dart';
import 'package:getx_food_app/core/routing/routes.dart';
import 'package:getx_food_app/ui/views/food_detail_screen.dart';
import 'package:getx_food_app/ui/views/home_screen.dart';
import 'package:getx_food_app/ui/views/sign_in_sign_up_screen.dart';
import 'package:getx_food_app/ui/views/welcome_screen.dart';

class PageRoutes {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.welcomeScreen:
        return MaterialPageRoute(builder: (context) => const WelcomeScreen());
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (context) => HomeScreen());
      case Routes.foodDetailScreen:
        FoodMenu foodMenu = settings.arguments as FoodMenu;
        return MaterialPageRoute(
            builder: (context) => FoodDetailScreen(foodMenu: foodMenu));

      case Routes.signInSignUpScreen:
        return MaterialPageRoute(builder: (context) => SignInSignUpScreen());
      // case Routes.registerScreen:
      //   return MaterialPageRoute(builder: (context) => const RegisterationScreen());
      // case Routes.loginScreen:
      //   return MaterialPageRoute(builder: (context) => const LoginScreen());
      default:
        return MaterialPageRoute(
            builder: (context) => const Text("No Page exists..."));
    }
  }
}
