import 'package:flutter/material.dart';
import 'package:photo_filter/components/save_aniamtion.dart';
import 'package:photo_filter/components/sticker_widget.dart';
import 'package:provider/provider.dart';
import '../controller/png_controller.dart';
import 'delete_sticker.dart';
import 'filtered_image.dart';
import 'original_image.dart';


class ImageMain extends StatelessWidget {
  const ImageMain({Key? key, required this.screen,}) : super(key: key);
  final GlobalKey screen;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: screen,
      child: Consumer<StickerController>(
        builder: (context, controller,_) {
          return GestureDetector(
            onScaleStart: (value){
              controller.baseScaleFactor = controller.scaleFactor;
            },
            onScaleUpdate: (value){
              controller.updateImageTransform(value);
            },
            onScaleEnd: (_){
              controller.showDeleteButton = false;
            },
            child: Stack(
              alignment: Alignment.center,
              children:  [
                OriginalImage(),
                FilteredImage(),
                StickerWidget(),
                DeleteSticker(),
                SaveImgAnimation()
              ],
            ),
          );
        }
      ),
    );
  }
}








