import 'dart:io';
import 'package:flutter/material.dart';
import 'package:photo_filter/components/image_filter.dart';
import 'package:provider/provider.dart';
import '../controller/app_controller.dart';
import '../controller/png_controller.dart';

class FilteredImage extends StatelessWidget {
  const FilteredImage({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Consumer<AppController>(
        builder: (context, controller,_) {
          return GestureDetector(
            onLongPress: (){
              controller.tempBlendImage = controller.blendImage;
              controller.setBlend(value: 0);
            },
            onLongPressUp: (){
              controller.setBlend(value: controller.tempBlendImage);
            },

            onTap: (){
              context.read<StickerController>().tempPng = null;
              context.read<StickerController>().showDeleteButton = false;
            },

            child: Opacity(
              opacity: controller.blendImage,
              child: Container(
                width: size.width,
                height: size.width,
                color: Colors.black,
                child: ImageFilter(
                  hue: controller.hue,
                  brightness: controller.brightness,
                  saturation: controller.saturation,
                  child: controller.imageController.photo?.path == null
                      ? Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white12, width: 5)
                          ),
                          child: const FittedBox(
                              child: Icon(Icons.camera_sharp,
                                color: Colors.white12,)
                          )
                      )
                      :ColorFiltered(
                          colorFilter: ColorFilter.matrix(controller.myFilter),
                          child: Image.file(File(controller.imageController.photo!.path), fit: BoxFit.cover,),
                  ),
                ),
              ),
            ),
          );
        }
    );
  }
}