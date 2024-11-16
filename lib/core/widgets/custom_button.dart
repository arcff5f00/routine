import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed; // Nullable
  final String text;
  final Color color;
  final Color textColor;
  final double borderRadius;
  final EdgeInsetsGeometry textPadding;

  const CustomButton({
    super.key,
    this.onPressed, // Nullable
    required this.text,
    required this.color,
    this.borderRadius = 6.0,
    this.textPadding = const EdgeInsets.symmetric(horizontal: 56, vertical: 8),
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxWidth: double.infinity,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: onPressed == null ? color.withOpacity(0.5) : color,
          // Faded color if disabled
          padding: textPadding,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          minimumSize: Size.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        child: Text(
          text,
          style: GoogleFonts.inter(
            fontSize: 14,
            color: textColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
