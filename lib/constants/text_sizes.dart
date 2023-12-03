import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class PrimaryTextSize extends StatelessWidget {
  final String textName;
  final double textSize;
  final Color textColor;
  final FontWeight textWeight;

  const PrimaryTextSize(
      {super.key, required this.textName,
      this.textColor = CupertinoColors.black,
      this.textWeight = FontWeight.w600,
      this.textSize = 14});

  @override
  Widget build(BuildContext context) {
    return Text(
      textName,
      style: GoogleFonts.inter(
          fontSize: textSize,
          fontWeight: textWeight,
          color: textColor),
    );
  }
}
