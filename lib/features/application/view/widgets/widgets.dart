import 'package:flutter/material.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/utils/image_res.dart';
import 'package:ulearning_app/common/widgets/image_widgets.dart';
import 'package:ulearning_app/features/home/view/home.dart';

var bottomBars = <BottomNavigationBarItem>[
  BottomNavigationBarItem(
      icon: _bottomBarContainer(),
      activeIcon: _bottomBarContainer(color: AppColors.primaryElement),
      backgroundColor: AppColors.primaryBackground,
      label: "Home"),
  BottomNavigationBarItem(
      icon: _bottomBarContainer(imagePath: ImageRes.search),
      activeIcon: _bottomBarContainer(
          imagePath: ImageRes.search,
          color: AppColors.primaryElement),
      backgroundColor: AppColors.primaryBackground,
      label: "Search"),
  BottomNavigationBarItem(
      icon: _bottomBarContainer(imagePath: ImageRes.play),
      activeIcon: _bottomBarContainer(
          imagePath: ImageRes.play,
          color: AppColors.primaryElement),
      backgroundColor: AppColors.primaryBackground,
      label: "Play"),
  BottomNavigationBarItem(
      icon: _bottomBarContainer(imagePath: ImageRes.message),
      activeIcon: _bottomBarContainer(
          imagePath: ImageRes.message,
          color: AppColors.primaryElement),
      backgroundColor: AppColors.primaryBackground,
      label: "Message"),
  BottomNavigationBarItem(
      icon: _bottomBarContainer(imagePath: ImageRes.profile),
      activeIcon: _bottomBarContainer(
          imagePath: ImageRes.profile,
          color: AppColors.primaryElement),
      backgroundColor: AppColors.primaryBackground,
      label: "Profile")
];

Widget _bottomBarContainer(
    {double width = 15,
    double height = 15,
    String imagePath = ImageRes.home,
    Color color = AppColors.primaryFourElementText}) {
  return SizedBox(
    height: 15,
    width: 15,
    child: appImageWithColor(iconPath: imagePath, color: color),
  );
}

Widget appScreen({int index = 0}) {
  List<Widget> screens = [
    Home(),
    Center(child: appImage(iconPath: ImageRes.search),),
    Center(child: appImage(iconPath: ImageRes.play),),
    Center(child: appImage(iconPath: ImageRes.message),),
    Center(child: appImage(iconPath: ImageRes.profile),)
  ];
  return screens[index];
}
