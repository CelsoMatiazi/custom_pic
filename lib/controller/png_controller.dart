
import 'package:flutter/cupertino.dart';

class StickerController extends ChangeNotifier{

  List<PngModel> myPng = [];
  PngModel? tempPng;

  var scaleFactor = 1.0;
  var baseScaleFactor = 1.0;
  bool showDeleteButton = false;
  bool activateDeleteButton = false;
  bool activateTimer = true;

  void addPng(PngModel png){
    var temp = PngModel(
        path: png.path,
        id: myPng.length + 1
    );
    myPng.add(temp);
    notifyListeners();
  }

  void removePng(PngModel png){
    myPng.remove(png);
    notifyListeners();
  }

  void updateImageTransform(value){
    if(tempPng != null){
      scaleFactor = baseScaleFactor * value.scale;
      tempPng?.scaleFactor = scaleFactor;
      notifyListeners();
    }
  }

  void deleteSticker(){
    if(activateDeleteButton) {
      removePng(tempPng!);
      tempPng = null;
      showDeleteButton = false;
    }
    notifyListeners();
  }

  void _trashTimer() async {
    showDeleteButton = true;
    if(activateTimer){
      activateTimer = false;
      await Future.delayed(const Duration(seconds: 2)).then((value) => activateTimer = true);
    }
    showDeleteButton = false;
    notifyListeners();
  }


  void activateDeleteIcon(PngModel e, double size){
    var stickerSize = 100 * e.scaleFactor;
    activateDeleteButton = false;
    if(e.top > (size - ( stickerSize / 2 ) - 30)){
      if(e.left > (size / 2) - (stickerSize)
       && e.left < (size / 2) + (stickerSize / 2 ))
      {
        activateDeleteButton = true;
      }else{
        activateDeleteButton = false;
      }
    }
    _trashTimer();
   notifyListeners();
  }

}


class PngModel{
  int? id;
  String path;
  double top;
  double left;
  double scaleFactor;
  bool showAngleSlider = false;
  double rotateAngle;

  PngModel({
    this.id,
    required this.path,
    this.top = 0.0,
    this.left = 0.0,
    this.scaleFactor = 1.0,
    this.showAngleSlider = false,
    this.rotateAngle = 0.0
  });
}