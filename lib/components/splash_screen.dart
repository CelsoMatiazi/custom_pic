import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  var opacity = 0.0;
  _animateLogo() {
    opacity = 1;
    setState(() {});
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Future.delayed(const Duration(seconds: 1), () => _animateLogo());
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
            width: 300,
            child: Lottie.asset("assets/camera.json")
        ),

        const SizedBox(height: 15,),
        AnimatedOpacity(
            opacity: opacity,
            duration: const Duration(seconds: 3),
            child: Center(
              child: Image.asset("assets/logo2.png", width: 200,),
            ),
        ),

      ],
    );
  }
}
