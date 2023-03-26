import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SFProText extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final TextAlign? textAlign;
  const SFProText({super.key,  this.textStyle,required this.text,this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.poppins(
        textStyle: textStyle,
      ),
    );
  }
}
