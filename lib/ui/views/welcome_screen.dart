import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getx_food_app/core/constants/color_constants.dart';
import 'package:getx_food_app/core/constants/image_constants.dart';
import 'package:getx_food_app/core/constants/string_constants.dart';
import 'package:getx_food_app/core/constants/text_styles.dart';
import 'package:getx_food_app/core/persistence/get_storage.dart';
import 'package:getx_food_app/core/routing/routes.dart';
import '../widgets/common_button.dart';

// ignore: must_be_immutable
class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({super.key});

  GetStorageBox storage = GetStorageBox.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.orange4b3a,
      body: buildBody(context),
    );
  }

  Widget buildBody(context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                        color: ColorConstants.white, shape: BoxShape.circle),
                    child: Image.asset(
                      ImageConstants.logo,
                    ),
                  ),
                  const Text(
                    StringConstants.everyone,
                    style: TextStyles.textStyleFont65Weight800,
                  ),
                ],
              ),
            ),
            Stack(children: [
              Container(
                // width: 500,
                width: MediaQuery.of(context).size.width,
                foregroundDecoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      ColorConstants.orange4b3a,
                      ColorConstants.transparent,
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.center,
                    stops: [0.1, 0.8],
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      right: 0,
                      bottom: 20,
                      child: Image.asset(ImageConstants.face1),
                    ),
                    Image.asset(ImageConstants.face2),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                right: 5,
                left: 5,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  width: MediaQuery.of(context).size.width,
                  child: ButtonWidget(
                    onPressed: () {
                      if (storage.getIsLogin()=="true") {
                        Get.toNamed(Routes.homeScreen);
                      } else {
                        Get.toNamed(Routes.signInSignUpScreen);
                      }
                    },
                    text: StringConstants.started,
                    backgroundColor: ColorConstants.white,
                    textColor: ColorConstants.orange4b3a,
                  ),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
