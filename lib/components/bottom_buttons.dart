import 'package:flutter/material.dart';
import 'package:photo_filter/components/custom_bottom_sheet.dart';
import 'package:photo_filter/controller/app_controller.dart';
import 'package:provider/provider.dart';

class BottomButtons extends StatelessWidget {
  const BottomButtons({
    Key? key,
    required this.bottomSheet
  }) : super(key: key);

  final CustomBottomSheet bottomSheet;

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<AppController>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(
                  color: controller.imageController.photo == null
                      ? Colors.white24
                      : Colors.white
              ),
              shape: BoxShape.circle
          ),
          child: IconButton(
              onPressed: (){
                if(controller.imageController.photo != null)
                bottomSheet.equalizer(context);
              },
              icon: Icon(
                Icons.edit,
                color: controller.imageController.photo == null
                  ? Colors.white24
                  : Colors.white
                ,
              )
          ),
        ),

        Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              shape: BoxShape.circle
          ),
          child: IconButton(
              onPressed: () async {
                bottomSheet.camera(context);
              },
              icon: const Icon(Icons.camera_alt, color: Colors.white,)
          ),
        ),

        Container(
          decoration: BoxDecoration(
              border: Border.all(
                  color: controller.imageController.photo == null
                      ? Colors.white24
                      : Colors.white
              ),
              shape: BoxShape.circle
          ),
          child: IconButton(
              onPressed: (){
                if(controller.imageController.photo != null)
                bottomSheet.pngOptions(context);
              },
              icon: Icon(
                Icons.photo_library,
                  color: controller.imageController.photo == null
                  ? Colors.white24
                  : Colors.white
              )
          ),
        ),
      ],
    );
  }
}
