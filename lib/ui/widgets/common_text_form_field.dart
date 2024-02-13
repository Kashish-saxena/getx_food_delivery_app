import 'package:flutter/material.dart';
import 'package:getx_food_app/core/constants/color_constants.dart';
import 'package:getx_food_app/core/constants/text_styles.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    Key? key,
    required this.labelText,
    this.controller,
    this.obscureText = false,
    required this.onChanged,
  }) : super(key: key);

  final String labelText;
  final TextEditingController? controller;
  final bool obscureText;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      cursorColor: ColorConstants.black,
      onChanged: onChanged,
      style: TextStyles.textStyleFont17Weight600.copyWith(
        color: ColorConstants.black,
      ),
      decoration: InputDecoration(
        counterStyle: TextStyles.textStyleFont17Weight600,
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: ColorConstants.black),
        ),
        floatingLabelStyle: TextStyles.textStyleFont17Weight600.copyWith(
          color: ColorConstants.grey9b9b,
        ),
        labelText: labelText,
      ),
    );
  }
}
