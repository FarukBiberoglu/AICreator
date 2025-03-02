import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'action_buttons.dart';

class ActionButtonsRow extends StatelessWidget {
  final Function(ImageSource) pickImage;

  const ActionButtonsRow({
    Key? key,
    required this.pickImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ActionButton(
            label: 'Camera',
            icon: Icons.camera_alt_outlined,
            onTap: () => pickImage(ImageSource.camera),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: ActionButton(
            label: 'Gallery',
            icon: Icons.photo_library_outlined,
            onTap: () => pickImage(ImageSource.gallery),
          ),
        ),
      ],
    );
  }
}
