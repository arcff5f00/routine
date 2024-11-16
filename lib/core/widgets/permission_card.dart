import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class PermissionCard extends StatelessWidget {
  final String permissionLightIcon;
  final String permissionDarkIcon;
  final String cardTitle;
  final String cardDescription;

  const PermissionCard({
    super.key,
    required this.cardTitle,
    required this.cardDescription,
    required this.permissionLightIcon,
    required this.permissionDarkIcon,
  });

  String getCardIconPath(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return brightness == Brightness.dark
        ? permissionDarkIcon
        : permissionLightIcon;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final titleColor = theme.colorScheme.onBackground;
    final descriptionColor =
    theme.colorScheme.onBackground.withOpacity(0.4); // Set opacity here

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              SvgPicture.asset(
                getCardIconPath(context),
                width: 36,
                height: 36,
              ),
              SizedBox(width: 8,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cardTitle,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: titleColor,
                    ),
                  ),
                  Text(
                    textAlign: TextAlign.start,
                    cardDescription,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: descriptionColor,
                    ),
                  ),
                ],
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
