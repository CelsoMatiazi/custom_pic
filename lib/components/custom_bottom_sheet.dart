
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../controller/app_controller.dart';
import 'sticker_options.dart';
import 'filter_slider.dart';

class CustomBottomSheet{

  void equalizer(BuildContext context){
    _openBottomSheet(
        context: context,
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            height: 300,
            child: const SliderFilter()
        )
    );
  }

  void camera(BuildContext context){
    _openBottomSheet(
        context: context,
        child: SizedBox(
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: (){
                      context.read<AppController>().getImage(ImageSource.camera);
                      Navigator.pop(context);
                    },
                    child: const Text("CAMERA")
                ),
                TextButton(
                    onPressed: (){
                      context.read<AppController>().getImage(ImageSource.gallery);
                      Navigator.pop(context);
                    },
                    child: const Text("GALERIA")
                )
              ],
            )
        )
    );
  }


  void pngOptions(BuildContext context){
    _openBottomSheet(
        context: context,
        child: Container(
            padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20
            ),
            //height: 200,
            child: const StickerOptions()
        )
    );
  }

  void _openBottomSheet({
    required BuildContext context,
    required Widget child
  }){
    showModalBottomSheet<void>(
      barrierColor: Colors.transparent,
      backgroundColor: Colors.black,
      context: context,
      builder: (BuildContext context) {
        return child;
      },
    );
  }

}