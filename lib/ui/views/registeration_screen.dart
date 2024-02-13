import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_food_app/core/constants/color_constants.dart';
import 'package:getx_food_app/core/constants/string_constants.dart';
import 'package:getx_food_app/core/view_model/register_view_model.dart';
import 'package:getx_food_app/ui/widgets/common_button.dart';
import 'package:getx_food_app/ui/widgets/common_text_form_field.dart';

class RegisterationScreen extends StatelessWidget {
  RegisterationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GetStorage box = GetStorage();
    final registerViewModel = Get.find<RegisterViewModel>;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(
              () => TextFormFieldWidget(
                onChanged: (text) => registerViewModel,
                labelText: StringConstants.email,
              ),
            ),
            TextFormFieldWidget(
              onChanged: (text) {},
              labelText: StringConstants.password,
              obscureText: true,
            ),
            TextFormFieldWidget(
              onChanged: (text) {},
              labelText: StringConstants.confirmPassword,
              obscureText: true,
            ),
            Flexible(
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(top: 200),
                child: ButtonWidget(
                  text: StringConstants.signUp,
                  backgroundColor: ColorConstants.orange4b3a,
                  textColor: ColorConstants.white,
                  onPressed: () {
                    log(registerViewModel);
                    box.write("email", registerViewModel);
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
