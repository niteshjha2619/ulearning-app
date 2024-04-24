import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_app/common/utils/app_shadow.dart';
import 'package:ulearning_app/features/application/provider/notifier/application_nav_notifier.dart';
import 'package:ulearning_app/features/application/view/widgets/widgets.dart';

class Application extends ConsumerWidget{
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int index = ref.watch(applicationNavIndexProvider);
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: appScreen(index: index),
          bottomNavigationBar: Container(
            height: 58,
            decoration: appBoxShadowWithRadius(),
            child: BottomNavigationBar(
              elevation: 0,
              items: bottomBars,
              type: BottomNavigationBarType.fixed,
              currentIndex: index,
              onTap: (value) {
                ref.read(applicationNavIndexProvider.notifier).changeIndex(value);
              },
            ),
          ),
        ),
      ),
    );
  }
}
