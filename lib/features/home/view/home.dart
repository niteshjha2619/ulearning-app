import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_app/common/widgets/app_bar.dart';
import 'package:ulearning_app/common/widgets/search_widgets.dart';
import 'package:ulearning_app/features/home/controller/home_controller.dart';
import 'package:ulearning_app/features/home/view/widgets/home_widget.dart';

class Home extends ConsumerStatefulWidget {
  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  late PageController _controller;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    _controller = PageController(initialPage: ref.watch(homeScreenBannerDotsProvider));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: homeAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20,),
              const HelloText(),
              const UserName(),
              const SizedBox(height: 20,),
              searchBar(),
              const SizedBox(height: 20,),
              HomeBanner(controller: _controller, ref: ref),
              HomeMenuBar()
            ],
          ),
        ),
      ),
    );
  }
}
