import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_food_app/core/constants/color_constants.dart';
import 'package:getx_food_app/core/constants/image_constants.dart';
import 'package:getx_food_app/core/constants/string_constants.dart';
import 'package:getx_food_app/core/constants/text_styles.dart';
import 'package:getx_food_app/core/models/food_menu_model.dart';
import 'package:getx_food_app/core/routing/routes.dart';
import 'package:getx_food_app/core/view_model/home_view_model.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final HomeViewModel homeViewModel = Get.find();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        extendBody: true,
        backgroundColor: ColorConstants.greyf2f2f2,
        body: buildBody(),
        bottomNavigationBar: Obx(
          () => buildBottomNavigation(),
        ),
      ),
    );
  }

  Widget buildBody() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(ImageConstants.menu),
                      Image.asset(ImageConstants.cart),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    StringConstants.delicious,
                    style: TextStyles.textStyleFont34Weight700,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  buildSearch(),
                ],
              ),
            ),
            buildTabBar(),
          ],
        ),
      ),
    );
  }

  Widget buildSearch() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: ColorConstants.greyeeee,
      ),
      child: const TextField(
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: StringConstants.search,
            prefixIcon: Icon(Icons.search)),
      ),
    );
  }

  Widget buildTabBar() {
    return Container(
      margin: const EdgeInsets.only(left: 20),
      height: 450,
      child: Column(children: [
        TabBar(
          padding: const EdgeInsets.only(left: 0),
          isScrollable: true,
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorWeight: 3,
          indicatorColor: ColorConstants.orange4b3a,
          dividerColor: ColorConstants.transparent,
          labelStyle: TextStyles.textStyleFont17Weight400
              .copyWith(color: ColorConstants.orange4b3a),
          tabs: const [
            Tab(text: StringConstants.food),
            Tab(text: StringConstants.drinks),
            Tab(text: StringConstants.snacks),
            Tab(text: StringConstants.sauces),
          ],
        ),
        const SizedBox(
          height: 40,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 50),
          child: Align(
              alignment: Alignment.topRight,
              child: Text(
                StringConstants.more,
                style: TextStyles.textStyleFont17Weight400
                    .copyWith(fontSize: 15, color: ColorConstants.orange4b3a),
              )),
        ),
        buildTabs(),
      ]),
    );
  }

  Widget buildTabs() {
    return Expanded(
      child: TabBarView(
        children: [
          SizedBox(
            height: 300,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: foodMenu.length,
                itemBuilder: (context, index) {
                  FoodMenu foodMenuDetails = foodMenu[index];
                  return InkWell(
                    onTap: () => Get.toNamed(
                      Routes.foodDetailScreen,
                      arguments: foodMenuDetails,
                    ),
                    child: Container(
                      margin: const EdgeInsets.only(right: 20),
                      child: Stack(
                        children: [
                          Positioned(
                            top: 50,
                            child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 40),
                              height: 250,
                              width: 200,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: ColorConstants.white,
                                  boxShadow: const [
                                    BoxShadow(
                                        color: ColorConstants.greyeeee,
                                        spreadRadius: 10,
                                        blurRadius: 5,
                                        offset: Offset(0, 7))
                                  ]),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    foodMenuDetails.name,
                                    textAlign: TextAlign.center,
                                    style: TextStyles.textStyleFont17Weight600
                                        .copyWith(color: ColorConstants.black),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    foodMenuDetails.price,
                                    style: TextStyles.textStyleFont17Weight600
                                        .copyWith(
                                            color: ColorConstants.orange4b3a),
                                  ),
                                  const SizedBox(height: 30),
                                ],
                              ),
                            ),
                          ),
                          Image.asset(foodMenuDetails.image)
                        ],
                      ),
                    ),
                  );
                }),
          ),
          Container(),
          Container(),
          Container(),
        ],
      ),
    );
  }

  Widget buildBottomNavigation() {
    return Container(
      color: ColorConstants.greyf2f2f2,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: () {
              homeViewModel.changeIndex(0);
            },
            icon: homeViewModel.currentIndex.value == 0
                ? const Icon(
                    Icons.home,
                    color: ColorConstants.orange4b3a,
                  )
                : const Icon(Icons.home_outlined),
          ),
          IconButton(
            onPressed: () {
              homeViewModel.changeIndex(1);
            },
            icon: homeViewModel.currentIndex.value == 1
                ? const Icon(
                    Icons.favorite,
                    color: ColorConstants.orange4b3a,
                  )
                : const Icon(Icons.favorite_border_outlined),
          ),
          IconButton(
            onPressed: () {
              homeViewModel.changeIndex(2);
            },
            icon: homeViewModel.currentIndex.value == 2
                ? const Icon(
                    Icons.person,
                    color: ColorConstants.orange4b3a,
                  )
                : const Icon(Icons.person_outline_outlined),
          ),
          IconButton(
            onPressed: () {
              homeViewModel.changeIndex(3);
            },
            icon: homeViewModel.currentIndex.value == 3
                ? const Icon(
                    Icons.restore,
                    color: ColorConstants.orange4b3a,
                  )
                : const Icon(Icons.restore),
          ),
        ],
      ),
    );
  }
}
