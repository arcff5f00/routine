// lib/app/widgets/color_picker_dialog.dart
import 'package:flutter/material.dart';
import '../colors.dart';

class ColorPickerDialog extends StatelessWidget {
  final Function(ColorInfo) onColorSelected;

  const ColorPickerDialog({Key? key, required this.onColorSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Select Color'),
      content: Container(
        width: double.maxFinite,
        height: 300,
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
          ),
          itemCount: AppColors.categoryColors.length,
          itemBuilder: (context, index) {
            final colorInfo = AppColors.categoryColors[index];
            return Tooltip(
              message: colorInfo.name,
              child: InkWell(
                onTap: () {
                  onColorSelected(colorInfo);
                  Navigator.pop(context);
                },
                child: CircleAvatar(
                  backgroundColor: colorInfo.color,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
