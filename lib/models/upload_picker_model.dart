import 'package:flutter/material.dart';

class UploadPickerModel {
  final String svgPath;
  final String label;
  final VoidCallback? onTap;

  const UploadPickerModel({
    required this.svgPath,
    required this.label,
    this.onTap,
  });
}
