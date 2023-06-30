
import 'package:image_picker/image_picker.dart';

class SelectImage{

  final ImagePicker _imagePicker = ImagePicker();
  XFile? photo;

  Future<void> getImage(ImageSource imageSource) async {
    if(imageSource == ImageSource.camera){
      photo = await _imagePicker.pickImage(source: ImageSource.camera);
    } else {
      photo = await _imagePicker.pickImage(source: ImageSource.gallery);
    }
  }

}