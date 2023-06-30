import 'package:flutter/material.dart';

import '../controller/color_filter_generator.dart';

class ImageFilter extends StatelessWidget {
  const ImageFilter({
    Key? key,
    required this.brightness,
    required this.saturation,
    required this.hue,
    required this.child,
  }) : super(key: key);

  final double brightness;
  final double saturation;
  final double hue;
  final Widget child;


  @override
  Widget build(BuildContext context) {
    return ColorFiltered(
        colorFilter: ColorFilter.matrix(
            ColorFilterGenerator.brightnessAdjustMatrix(
              value: brightness,
            )
        ),
        child: ColorFiltered(
            colorFilter: ColorFilter.matrix(
                ColorFilterGenerator.saturationAdjustMatrix(
                  value: saturation,
                )
            ),
            child: ColorFiltered(
              colorFilter: ColorFilter.matrix(
                  ColorFilterGenerator.hueAdjustMatrix(
                    value: hue,
                  )
              ),
              child: child,
            )
        )
    );
  }
}
