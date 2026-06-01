import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../models/upload_picker_model.dart';
import 'upload_picker_viewmodel.dart';

class UploadPicker extends StatelessWidget {
  final UploadPickerViewModel viewModel;

  const UploadPicker({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children:
          viewModel.items
              .map((item) => _PickerButton(model: item))
              .expand((w) => [w, const SizedBox(width: 12)])
              .toList()
            ..removeLast(),
    );
  }
}

class _PickerButton extends StatelessWidget {
  final UploadPickerModel model;

  const _PickerButton({required this.model});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: model.onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(model.svgPath, width: 28, height: 28),
          const SizedBox(height: 4),
          Text(model.label, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}
