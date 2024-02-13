import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_food_app/core/constants/color_constants.dart';
import 'package:getx_food_app/core/constants/string_constants.dart';
import 'package:getx_food_app/core/constants/text_styles.dart';
import 'package:getx_food_app/ui/widgets/common_button.dart';
import 'package:getx_food_app/ui/widgets/common_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen(
      {super.key,
      required this.loginEmailController,
      required this.storageBox});
  final TextEditingController loginEmailController;
  final GetStorage storageBox;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormFieldWidget(
              onChanged: (text){},
              labelText: StringConstants.email,
              controller: loginEmailController),
          TextFormFieldWidget(
            onChanged: (text) {},
            obscureText: true,
            labelText: StringConstants.password,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            StringConstants.forgot,
            style: TextStyles.textStyleFont17Weight600
                .copyWith(color: ColorConstants.orange4b3a),
          ),
          Flexible(
            child: Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(top: 200),
              child: ButtonWidget(
                text: StringConstants.login,
                backgroundColor: ColorConstants.orange4b3a,
                textColor: ColorConstants.white,
                onPressed: () {
                  log(storageBox.read(
                    "email",
                  ));
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
