import 'package:flutter/material.dart';
import 'package:photo_filter/controller/matrix_class.dart';

class OverlaidWidget extends StatelessWidget {
  final Widget child;
  const OverlaidWidget({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<Matrix4> notifier = ValueNotifier(Matrix4.identity());
    return MatrixGestureDetector(
        onMatrixUpdate: (m, tm, sm, rm){
          notifier.value = m;
        },
        onScaleStart: () {  },
        onScaleEnd: () {  },
        child: AnimatedBuilder(
          animation: notifier,
          builder: (ctx, childWidget){
            return Transform(
                transform: notifier.value,
              child: Align(
               // alignment: Alignment.center,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: child,
                ),
              )
            );
          },
        )
    );
  }
}
