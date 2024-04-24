import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/utils/app_shadow.dart';
import 'package:ulearning_app/common/utils/constants.dart';
import 'package:ulearning_app/global.dart';

import '../../../common/widgets/text_widgets.dart';

class AppOnBoardingPage extends StatelessWidget {
  final PageController controller;
  final BuildContext context;
  final String imagePath;
  final String title;
  final String subTitle;
  final int index;

  const AppOnBoardingPage(
      {super.key,
      required this.controller,
      required this.context,
      required this.imagePath,
      required this.title,
      required this.subTitle,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Image.asset(
            imagePath,
            fit: BoxFit.fitWidth,
          ),
          Container(
              margin: const EdgeInsets.only(top: 15),
              child: text24Normal(text: title)),
          Container(
            margin: const EdgeInsets.only(top: 15, left: 30, right: 30),
            child: Text16Normal(text: subTitle),
          ),
          _nextButton(index, controller, context),
          const SizedBox(
            height: 20,
          ),
      
          DotsIndicator(
            mainAxisAlignment: MainAxisAlignment.center,
            dotsCount: 3,
            position: index,
            decorator: DotsDecorator(
                size: const Size.square(9.0),
                activeSize: const Size(22.0, 8.0),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0))),
          ),
          const SizedBox(
            height: 20,
          )
          //Image.asset("assets/images/boy.png")
        ],
      ),
    );
  }
}

Widget _nextButton(int index, PageController controller, BuildContext context) {
  return GestureDetector(
    onTap: () {
      if (index < 2) {
        controller.animateToPage(index,
            duration: const Duration(milliseconds: 300), curve: Curves.linear);
      } else {
        Global.storageServices
            .setBool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_KEY, true);
        Navigator.pushNamed(context, "/sign_in");
      }
    },
    child: Container(
      margin: const EdgeInsets.only(left: 25, right: 25, top: 100),
      width: 325,
      height: 50,
      decoration: appBoxShadow(),
      child: Center(
          child: Text16Normal(
              text: index < 2 ? "Next" : "Get Started",
              color: AppColors.primaryBackground)),
    ),
  );
}
