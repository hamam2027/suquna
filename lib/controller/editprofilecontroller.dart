import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileScreenController extends GetxController {
  List<XFile> images = [];
  final ImagePicker picker = ImagePicker();
  File? imagefile;
  XFile? image;
  List<XFile>? imagess;
  takephotoFromGalary() async {
    imagess = await picker.pickMultipleMedia(imageQuality: 80, limit: 10);
    if (image != null) {
      imagefile = File(image!.path);
    }

    update();
  }

  takephotoFromCamera() async {
    image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      imagefile = File(image!.path);
    }
    update();
  }
// Pick an image.
// final XFile? image = await picker.pickImage(source: ImageSource.gallery);
// // Capture a photo.
// final XFile? photo = await picker.pickImage(source: ImageSource.camera);
// // Pick a video.
// final XFile? galleryVideo =
//     await picker.pickVideo(source: ImageSource.gallery);
// // Capture a video.
// final XFile? cameraVideo = await picker.pickVideo(source: ImageSource.camera);
// // Pick multiple images.
// final List<XFile> images = await picker.pickMultiImage();
// // Pick singe image or video.
// final XFile? media = await picker.pickMedia();
// // Pick multiple images and videos.
// final List<XFile> medias = await picker.pickMultipleMedia();
}
