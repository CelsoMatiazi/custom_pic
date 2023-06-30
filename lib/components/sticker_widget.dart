import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import '../controller/png_controller.dart';


class StickerWidget extends StatefulWidget {
  const StickerWidget({Key? key}) : super(key: key);

  @override
  State<StickerWidget> createState() => _StickerWidgetState();
}

class _StickerWidgetState extends State<StickerWidget> {

  double _stickerMinSize(double value){
    if(value > 30) return value;
    return 30;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Consumer<StickerController>(
        builder: (context, controller,_) {
          return SizedBox(
            height: size.width,
            width: size.width,
            child: Stack(
                children: controller.myPng.map((e){
                  return Positioned(
                      top: e.top,
                      left: e.left,
                      child: GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onLongPress: (){
                            e.showAngleSlider = !e.showAngleSlider;
                            setState(() {});
                          },
                          onLongPressEnd: (_){
                            controller.showDeleteButton = false;
                          },
                          onPanUpdate: (position){
                            e.top = max(-300, e.top + position.delta.dy);
                            e.left = max(-300, e.left + position.delta.dx);
                            controller.tempPng = e;
                            controller.activateDeleteIcon(e, size.width);
                            controller.showDeleteButton = true;
                          },
                          onPanEnd: (_){
                            controller.deleteSticker();
                          },
                          child: SizedBox(
                            width: _stickerMinSize(100 * (e.scaleFactor)),
                            height:_stickerMinSize(100 * (e.scaleFactor)),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [

                                Transform.rotate(
                                  angle: e.rotateAngle / 20,
                                  child: Image.asset(
                                    e.path,
                                    fit: BoxFit.contain,
                                  ),
                                ),

                                if(e.showAngleSlider)
                                  SleekCircularSlider(
                                      appearance:  CircularSliderAppearance(
                                          animationEnabled: false,
                                          infoProperties: InfoProperties(
                                              mainLabelStyle: const TextStyle(color: Colors.transparent)
                                          )
                                      ),
                                      onChange: (double value) {
                                        e.rotateAngle = value - 50;
                                        setState(() {});
                                      }),
                              ],
                            ),
                          )

                      )
                  );
                }).toList()
            ),
          );
        }
    );
  }
}