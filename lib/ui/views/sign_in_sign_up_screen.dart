import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getx_food_app/core/constants/color_constants.dart';
import 'package:getx_food_app/core/constants/image_constants.dart';
import 'package:getx_food_app/core/constants/string_constants.dart';
import 'package:getx_food_app/core/constants/text_styles.dart';
import 'package:getx_food_app/core/models/signup_request_model.dart';
import 'package:getx_food_app/core/utils/signup_validations.dart';
import 'package:getx_food_app/core/view_model/sign_in_sign_up_view_model.dart';
import 'package:getx_food_app/ui/widgets/common_button.dart';
import 'package:getx_food_app/ui/widgets/common_text_form_field.dart';

class SignInSignUpScreen extends StatelessWidget {
  SignInSignUpScreen({super.key});
  final SignInSignUpViewModel signInSignUpViewModel = Get.find();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: PopScope(
        canPop: false,
        onPopInvoked: (didPop) => SystemNavigator.pop(),
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
                      dividerColor: ColorConstants.transparent,
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
                    buildLoginTab(context),
                    buildRegistrationTab(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildLoginTab(BuildContext context) {
    return Obx(() => signInSignUpViewModel.userLoading.value
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height / 1.5,
                margin:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormFieldWidget(
                      onChanged: (value) =>
                          signInSignUpViewModel.loginEmail = value.obs,
                      labelText: StringConstants.email,
                    ),
                    TextFormFieldWidget(
                      onChanged: (value) =>
                          signInSignUpViewModel.loginPassword = value.obs,
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
                        margin: const EdgeInsets.only(top: 250),
                        child: ButtonWidget(
                          text: StringConstants.login,
                          backgroundColor: ColorConstants.orange4b3a,
                          textColor: ColorConstants.white,
                          onPressed: () {

                            signInSignUpViewModel.validateLogin();
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            
    ),);
           
  }

  Widget buildRegistrationTab(BuildContext context) {
    return Obx(
      () => signInSignUpViewModel.userLoading.value
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height / 1.5,
                margin:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
                child: Form(
                  key: signInSignUpViewModel.registerKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormFieldWidget(
                        onChanged: (value) =>
                            signInSignUpViewModel.registerName(value),
                        validator: (val) => SignUpValidations.isNameValid(val),
                        labelText: StringConstants.name,
                      ),
                      TextFormFieldWidget(
                        onChanged: (value) =>
                            signInSignUpViewModel.setEmail(value),
                        validator: (value) =>
                            SignUpValidations.isEmailValid(value),
                        labelText: StringConstants.email,
                      ),
                      TextFormFieldWidget(
                        onChanged: (value) =>
                            signInSignUpViewModel.registerPassword(value),
                        labelText: StringConstants.password,
                        validator: (value) =>
                            SignUpValidations.isPasswordValid(value),
                        obscureText: true,
                      ),
                      TextFormFieldWidget(
                        onChanged: (value) => signInSignUpViewModel
                            .registerConfirmPassword(value),
                        labelText: StringConstants.confirmPassword,
                        obscureText: true,
                        validator: (value) =>
                            signInSignUpViewModel.registerPassword.value ==
                                        signInSignUpViewModel
                                            .registerConfirmPassword.value &&
                                    signInSignUpViewModel
                                        .registerConfirmPassword
                                        .value
                                        .isNotEmpty
                                ? null
                                : StringConstants.correctPassword,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 12),
                        child: Row(
                          children: [
                            const Text(
                              StringConstants.gender,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Color(0xff8391A1),
                              ),
                            ),
                            Flexible(
                              child: ListTile(
                                textColor: const Color(0xff8391A1),
                                contentPadding: EdgeInsets.zero,
                                leading: GetBuilder<SignInSignUpViewModel>(
                                  builder: (_) => Radio(
                                    activeColor: Colors.blue,
                                    value: signInSignUpViewModel.gender[0],
                                    groupValue: signInSignUpViewModel.select,
                                    onChanged: (value) => signInSignUpViewModel
                                        .onClickRadioButton(value),
                                  ),
                                ),
                                title: const Text(StringConstants.male),
                              ),
                            ),
                            Flexible(
                              child: ListTile(
                                textColor: const Color(0xff8391A1),
                                contentPadding: EdgeInsets.zero,
                                leading: GetBuilder<SignInSignUpViewModel>(
                                  builder: (_) => Radio(
                                    activeColor: Colors.blue,
                                    value: signInSignUpViewModel.gender[1],
                                    groupValue: signInSignUpViewModel.select,
                                    onChanged: (value) => signInSignUpViewModel
                                        .onClickRadioButton(value),
                                  ),
                                ),
                                title: const Text(StringConstants.female),
                              ),
                            )
                          ],
                        ),
                      ),
                      Flexible(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.only(top: 90),
                          child: ButtonWidget(
                            text: StringConstants.signUp,
                            backgroundColor: ColorConstants.orange4b3a,
                            textColor: ColorConstants.white,
                            onPressed: () {
                              if (signInSignUpViewModel.registerKey.currentState
                                      ?.validate() ??
                                  false) {
                                signInSignUpViewModel
                                    .postUser(SignUpRequestModel(
                                  name:
                                      signInSignUpViewModel.registerName.value,
                                  email:
                                      signInSignUpViewModel.registerEmail.value,
                                  gender: signInSignUpViewModel.select,
                                  status: StringConstants.active,
                                ));
                              } else {
                                Get.snackbar(
                                    StringConstants.registerConfirmation,
                                    StringConstants.enterDetails);
                              }
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
