import 'package:flutter/material.dart';
import 'package:getx_food_app/core/constants/color_constants.dart';
import 'package:getx_food_app/core/constants/image_constants.dart';
import 'package:getx_food_app/core/constants/string_constants.dart';
import 'package:getx_food_app/core/constants/text_styles.dart';
import 'package:getx_food_app/core/routing/routes.dart';

import '../widgets/common_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.orange4b3a,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
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
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Positioned(
                        right: 0,
                        bottom: 20,
                        child: Image.asset(ImageConstants.face1)),
                    Image.asset(ImageConstants.face2),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                width: MediaQuery.of(context).size.width,
                child: ButtonWidget(
                  onPressed: () =>
                      Navigator.pushNamed(context, Routes.signInSignUpScreen),
                  text: StringConstants.started,
                  backgroundColor: ColorConstants.white,
                  textColor: ColorConstants.orange4b3a,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
