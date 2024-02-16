import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_food_app/core/constants/color_constants.dart';
import 'package:getx_food_app/core/constants/string_constants.dart';
import 'package:getx_food_app/core/constants/text_styles.dart';
import 'package:getx_food_app/core/models/food_menu_model.dart';
import 'package:getx_food_app/ui/widgets/common_button.dart';

class FoodDetailScreen extends StatelessWidget {
  const FoodDetailScreen({Key? key, required this.foodMenu}) : super(key: key);
  final FoodMenu foodMenu;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(context),
    );
  }

  Widget buildBody(context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.favorite_border),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 300,
                    width: 300,
                    child: Image.asset(
                      foodMenu.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(foodMenu.name,
                      style: TextStyles.textStyleFont34Weight700
                          .copyWith(fontSize: 25)),
                  const SizedBox(height: 5),
                  Text(foodMenu.price,
                      style: TextStyles.textStyleFont34Weight700.copyWith(
                          color: ColorConstants.orange4b3a, fontSize: 25)),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(StringConstants.delivery,
                      style: TextStyles.textStyleFont17Weight600
                          .copyWith(color: ColorConstants.black)),
                  const SizedBox(height: 5),
                  const Text(
                    StringConstants.deliveryInfo,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(StringConstants.policy,
                      style: TextStyles.textStyleFont17Weight600
                          .copyWith(color: ColorConstants.black)),
                  const SizedBox(height: 5),
                  const Text(
                    StringConstants.policyDescription,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 40),
                child: ButtonWidget(
                  text: StringConstants.cart,
                  backgroundColor: ColorConstants.orange4b3a,
                  textColor: ColorConstants.white,
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
