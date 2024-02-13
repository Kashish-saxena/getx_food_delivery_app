import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_food_app/core/constants/color_constants.dart';
import 'package:getx_food_app/core/constants/image_constants.dart';
import 'package:getx_food_app/core/constants/string_constants.dart';
import 'package:getx_food_app/core/constants/text_styles.dart';
import 'package:getx_food_app/ui/views/login_screen.dart';
import 'package:getx_food_app/ui/views/registeration_screen.dart';

class SignInSignUpScreen extends StatelessWidget {
  const SignInSignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController loginEmailController = TextEditingController();

    GetStorage box = GetStorage();
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        extendBody: true,
        backgroundColor: ColorConstants.greyf2f2f2,
        body: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: ColorConstants.white,
              ),
              height: 300,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 100),
                    height: 150,
                    width: 150,
                    child: Image.asset(
                      ImageConstants.logo2,
                      fit: BoxFit.contain,
                    ),
                  ),
                  TabBar(
                    dividerColor: Colors.transparent,
                    indicatorColor: ColorConstants.orange4b3a,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorPadding:
                        const EdgeInsets.symmetric(horizontal: 40),
                    labelStyle: TextStyles.textStyleFont17Weight600
                        .copyWith(color: ColorConstants.black),
                    tabs: const [
                      Tab(text: StringConstants.login),
                      Tab(text: StringConstants.signUp),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  LoginScreen(
                      loginEmailController: loginEmailController,
                      storageBox: box),
                  RegisterationScreen(
                     ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
