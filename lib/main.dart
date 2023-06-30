import 'package:flutter/material.dart';
import 'package:photo_filter/components/custom_bottom_sheet.dart';
import 'package:photo_filter/components/splash_screen.dart';
import 'package:photo_filter/controller/app_controller.dart';
import 'package:photo_filter/controller/png_controller.dart';
import 'package:provider/provider.dart';
import 'home.dart';

void main() async {

  runApp(const SplashScreen());
  await Future.delayed(const Duration(seconds: 5));

  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => AppController(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => StickerController(),
        )
      ],

      child: const MyApp())
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Photo Filter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(bottomSheet: CustomBottomSheet(),),
    );

  }
}

