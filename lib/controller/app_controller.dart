
import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_filter/data_filters/filter_model.dart';
import 'package:photo_filter/data_filters/filters.dart';
import 'package:share_files_and_screenshot_widgets/share_files_and_screenshot_widgets.dart';
import 'selected_image.dart';

class AppController extends ChangeNotifier{

  final imageController = SelectImage();

  List<double> myFilter = filterTemplates[0].filter;
  List<FilterModel> filters = filterTemplates;

  double hue = 0.0;
  double brightness = 0.0;
  double saturation = 0.0;
  double blendImage = 1;
  double tempBlendImage = 1;
  bool showAnimation = false;
  bool loading = false;

  Future<void> getImage(ImageSource source) async {
    await imageController.getImage(source);
    notifyListeners();
  }

  void setFilter(List<double> filter){
    myFilter = filter;
    notifyListeners();
  }

  void setBrightnessFilter({required double brightness}){
    this.brightness = brightness;
    notifyListeners();
  }

  void setHueFilter({required double hue}){
    this.hue = hue;
    notifyListeners();
  }

  void setSaturationFilter({required double saturation}){
    this.saturation = saturation;
    notifyListeners();
  }

  void setBlend({required double value}){
    blendImage = value;
    notifyListeners();
  }

  void resetFiltersSettings(){
    hue = 0;
    saturation = 0;
    brightness = 0;
    blendImage = 1;
    notifyListeners();
  }


  Future<Uint8List?> _getImageToSave(GlobalKey screen) async {
    try{
      _showLoading();
      final RenderRepaintBoundary boundary = screen.currentContext?.findRenderObject() as RenderRepaintBoundary;
      final image = await boundary.toImage(pixelRatio: 3);
      final ByteData? byteData = await image.toByteData(format: ImageByteFormat.png);
      final pngBytes = byteData?.buffer.asUint8List();
      return pngBytes;
    } catch(e){
      debugPrint(e.toString());
    }
    return null;
  }

  Future<void> saveImageOnGallery(GlobalKey screen) async {
    var image = await _getImageToSave(screen);
    if(image != null && imageController.photo != null){
      try{
        await ImageGallerySaver.saveImage(image);
        _showAnimation();
      }catch(e){
        print("error -> $e");
      }
    }
  }

  Future<void> shareImage(GlobalKey screen) async {
    var image = await _getImageToSave(screen);
    if(image != null && imageController.photo != null){
      ShareFilesAndScreenshotWidgets().shareFile(
          "comprovante",
          'comp.jpg',
           image,
          'image/jpg'
      );
    }
  }

  _showAnimation() async {
    showAnimation = true;
    loading = false;
    notifyListeners();
    await Future.delayed(Duration(seconds: 2));
    showAnimation = false;
    notifyListeners();
  }

  _showLoading(){
    loading = true;
    notifyListeners();
  }

}