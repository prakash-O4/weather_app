import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mausam/presentation/shared_components/sf_pro_text.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const CustomButton({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF3BAC76),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
      ),
      onPressed: onPressed,
      child: SFProText(
        text: text,
        textStyle: GoogleFonts.roboto(
          fontSize: 14,
          color: Colors.white.withOpacity(0.8),
        ),
      ),
    );
  }
}
