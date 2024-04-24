import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/utils/app_shadow.dart';
import 'package:ulearning_app/common/utils/image_res.dart';
import 'package:ulearning_app/common/widgets/app_textfields.dart';
import 'package:ulearning_app/common/widgets/image_widgets.dart';
import 'package:ulearning_app/features/home/controller/home_controller.dart';

class HomeBanner extends StatelessWidget {
  final PageController controller;
  final WidgetRef ref;
  const HomeBanner({super.key, required this.controller, required this.ref});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 160,
          width: 325,
          child: PageView(
            controller: controller,
            onPageChanged: (index) {
              ref.read(homeScreenBannerDotsProvider.notifier).setIndex(index);
            },
            children: [
              bannerContainer(imagePath: ImageRes.banner1),
              bannerContainer(imagePath: ImageRes.banner2),
              bannerContainer(imagePath: ImageRes.banner3),
            ],
          ),
        ),
        SizedBox(
          height: 5,
        ),
        DotsIndicator(
          mainAxisAlignment: MainAxisAlignment.center,
          dotsCount: 3,
          position: ref.watch(homeScreenBannerDotsProvider),
          decorator: DotsDecorator(
              size: const Size.square(9.0),
              activeSize: const Size(22.0, 8.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0))),
        )
      ],
    );
  }

}

Widget bannerContainer({required String imagePath}) {
  return Container(
    width: 325,
    height: 160,
    decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.fill)),
  );
}

Widget searchBar() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        height: 40,
        width: 280,
        decoration: appBoxShadow(
            color: AppColors.primaryBackground,
            boxBorder: Border.all(color: AppColors.primaryFourElementText)),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 17),
              child: appImage(iconPath: ImageRes.searchIcon),
            ),
            SizedBox(
                height: 40,
                width: 240,
                child: appTextFieldOnly(
                    width: 240, height: 40, hintText: "Search your course..."))
          ],
        ),
      ),
      GestureDetector(
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.all(5.0),
          height: 40,
          width: 40,
          decoration: appBoxShadow(),
          child: appImage(iconPath: ImageRes.searchButton),
        ),
      )
    ],
  );
}
