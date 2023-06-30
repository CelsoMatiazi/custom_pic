import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/png_controller.dart';

class DeleteSticker extends StatelessWidget {
  const DeleteSticker({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Consumer<StickerController>(
        builder: (context, controller, _) {
          if(controller.showDeleteButton) {
            return SizedBox(
              width: size.width,
              height: size.width,
              child:  Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: controller.activateDeleteButton ? Colors.red : Colors.white
                  ),
                  child: Icon(
                    Icons.delete_outline,
                    size: 28,
                    color: controller.activateDeleteButton ? Colors.white : Colors.red ,
                  ),
                ),
              ),
            );
          }
          return const SizedBox();
        }
    );
  }
}
