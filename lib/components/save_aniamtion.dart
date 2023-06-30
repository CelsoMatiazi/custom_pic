import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../controller/app_controller.dart';

class SaveImgAnimation extends StatefulWidget {
  const SaveImgAnimation({
    Key? key,
  }) : super(key: key);

  @override
  State<SaveImgAnimation> createState() => _SaveImgAnimationState();
}

class _SaveImgAnimationState extends State<SaveImgAnimation> with TickerProviderStateMixin{

  late final AnimationController _controller;

  _showSaveAnimation(){
    var state = Provider.of<AppController>(context);
    if(state.showAnimation){
      _controller.forward();
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _controller.duration = const Duration(seconds: 2);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _showSaveAnimation();
  }

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<AppController>(context);
    return Column(
      children: [

        if(state.loading)
        Center(
          child: CircularProgressIndicator(color: Colors.white,),
        ),

        if(state.showAnimation)
          Lottie.asset("assets/done.json",
              alignment: Alignment.center,
              width: 200,
              controller: _controller
          ),
      ],
    );
  }
}

