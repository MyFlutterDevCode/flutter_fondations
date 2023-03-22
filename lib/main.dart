import 'package:flutter/material.dart';
import 'package:flutter_fondations/randomier_change_notifier.dart';
import 'package:flutter_fondations/range_selector_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const AppWidget());
}

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => RandomizerChangeNotifier(),
      child: MaterialApp(
        title: 'Randomizer',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true,
        ),
        home: RangeSelectorPage(),
      ),
    );
  }
}
