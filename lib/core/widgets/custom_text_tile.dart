import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  CustomTextTile(
      {required this.title, required this.onTap, required this.icon});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap, // Trigger the onTap callback when tapped
      child: Material(
        color: Colors.transparent, // Transparent color for the Material
        child: InkWell(
          onTap: onTap,
          // Trigger the onTap callback when tapped
          splashColor: theme.colorScheme.primary.withOpacity(0.2),
          // Ripple effect color
          highlightColor: theme.colorScheme.primary.withOpacity(0.1),
          borderRadius: BorderRadius.circular(4),
          // Highlight effect color
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 6, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    // Font size for the text
                    color: theme.colorScheme.onSurface.withOpacity(0.5),
                    // Text color
                    fontWeight: FontWeight.w500, // Font weight
                  ),
                ),
                Icon(
                  size: 18,
                  icon,
                  color: theme.colorScheme.onSecondary.withOpacity(0.5),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
