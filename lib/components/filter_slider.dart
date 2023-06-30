import 'package:flutter/material.dart';
import 'package:photo_filter/controller/app_controller.dart';
import 'package:provider/provider.dart';

class SliderFilter extends StatelessWidget {
  const SliderFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<AppController>(context);
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const Text('Brightness',
            style: TextStyle(color: Colors.white),
          ),
          Slider(
            value: controller.brightness,
            max: 1,
            min: -1,
            divisions: 100,
            label: controller.brightness.toStringAsPrecision(2),
            onChanged: (double value) {
              controller.setBrightnessFilter(brightness: value);
            },
          ),

          const Text('Saturation',
            style: TextStyle(color: Colors.white),
          ),
          Slider(
            value: controller.saturation,
            max: 1,
            min: -1,
            divisions: 100,
            label: controller.saturation.toStringAsPrecision(2),
            onChanged: (double value) {
              controller.setSaturationFilter(saturation: value);
            },
          ),

          const Text('Hue',
            style: TextStyle(color: Colors.white),
          ),
          Slider(
            value: controller.hue,
            max: 1,
            min: -1,
            divisions: 100,
            label: controller.hue.toStringAsPrecision(2),
            onChanged: (double value) {
              controller.setHueFilter(hue: value);
            },
          ),

          const Text('Blend',
            style: TextStyle(color: Colors.white),
          ),
          Slider(
            value: controller.blendImage,
            max: 1,
            min: 0,
            divisions: 100,
            label: controller.blendImage.toStringAsPrecision(2),
            onChanged: (double value) {
              controller.setBlend(value: value);
            },
          ),
        ],
      ),
    );
  }
}
