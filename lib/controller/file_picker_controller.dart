import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class FilePickerController extends GetxController{
  XFile? newImage;

  getImage () async{
    final ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      newImage = image;
      update();
    }
    return image;
  }

}

