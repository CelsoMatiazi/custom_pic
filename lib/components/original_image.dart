import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/app_controller.dart';

class OriginalImage extends StatelessWidget {
  const OriginalImage({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Consumer<AppController>(
        builder: (context, controller,_) {
          return Container(
            width: size.width,
            height: size.width,
            color: Colors.white,
            child: controller.imageController.photo == null
                ? Container(color: Colors.black,)
                : Image.file(File(controller.imageController.photo!.path), fit: BoxFit.cover,),
          );
        }
    );
  }
}