import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_app/pages/welcome/widgets.dart';

import 'notifier/welcome_notifier.dart';

final indexProvider = StateProvider<int>((ref) => 0);

class Welcome extends ConsumerWidget {
  final PageController _controller = PageController();
  int dotIndex = 0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(indexDotProvider);
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            margin: const EdgeInsets.only(top: 30),
            child: Stack(
              alignment: Alignment.center,
              children: [
                PageView(
                  onPageChanged: (value) {
                    ref.read(indexDotProvider.notifier).changeIndex(value);
                  },
                  controller: _controller,
                  children: [
                    appOnBoardingPage(_controller, context,
                        imagePath: "assets/images/reading.png",
                        title: "First see Learning",
                        subTitle:
                            "Forget about of paper, now learning all in one place",
                        index: 1),
                    appOnBoardingPage(_controller, context,
                        imagePath: "assets/images/man.png",
                        title: "Connect With Everyone",
                        subTitle:
                            "Always keep in touch with your tutor and friends, Let's get conected !!",
                        index: 2),
                    appOnBoardingPage(
                      _controller,
                      context,
                      imagePath: "assets/images/boy.png",
                      title: "Always Fascinated",
                      subTitle:
                          "Anywhere. Anytime. The time is at your direction. so study wherever you can",
                      index: 3,
                    )
                  ],
                ),
                Positioned(
                  bottom: 10,
                  child: DotsIndicator(
                    mainAxisAlignment: MainAxisAlignment.center,
                    dotsCount: 3,
                    position: index,
                    decorator: DotsDecorator(
                        size: Size.square(9.0),
                        activeSize: Size(22.0, 8.0),
                        activeShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
