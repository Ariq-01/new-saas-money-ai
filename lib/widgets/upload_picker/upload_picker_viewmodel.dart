import 'package:flutter/material.dart';
import '../../models/upload_picker_model.dart';

class UploadPickerViewModel extends ChangeNotifier {
  final List<UploadPickerModel> items;

  UploadPickerViewModel({VoidCallback? onCamera, VoidCallback? onGallery})
    : items = [
        UploadPickerModel(
          svgPath: 'assets/icon/photo_camera.svg',
          label: 'Camera',
          onTap: onCamera,
        ),
        UploadPickerModel(
          svgPath: 'assets/icon/image.svg',
          label: 'Gallery',
          onTap: onGallery,
        ),
      ];
}
