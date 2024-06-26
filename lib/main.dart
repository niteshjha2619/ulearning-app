import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_app/common/routes/routes.dart';
import 'package:ulearning_app/common/widgets/app_style.dart';
import 'package:ulearning_app/global.dart';

Future<void> main() async {
  await Global.init();
  runApp(const ProviderScope(child: MyApp()));
}

final GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navKey,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.appThemeData,
      onGenerateRoute: AppPages.generateRouteSetting,
    );
  }
}

final appCount = StateProvider<int>((ref) {
  return 0;
});

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int count = ref.watch(appCount);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text('Demo'),
        ),
        body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                count.toString(),
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FloatingActionButton(
              heroTag: "one",
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SecondPage()));
              },
              tooltip: 'Increment',
              child: const Icon(Icons.arrow_forward_ios),
            ),
            FloatingActionButton(
              heroTag: "two",
              onPressed: () {
                ref.read(appCount.notifier).state++;
              },
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
          ],
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}

class SecondPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int count = ref.watch(appCount);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          child: Text('Count Value $count'),
        ),
      ),
    );
  }
}
