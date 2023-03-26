import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mausam/presentation/shared_components/sf_pro_text.dart';

class SearchBox extends StatelessWidget {
  final TextEditingController controller;
  const SearchBox({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: GoogleFonts.poppins(color: Colors.white.withOpacity(0.8)),
      decoration: InputDecoration(
        isDense: true,
        hintText: "Search for a city",
        hintStyle: TextStyle(
          color: Colors.white.withOpacity(0.5),
        ),
        prefixIcon: Icon(
          Icons.search,
          color: Colors.white.withOpacity(0.5),
        ),
        filled: true,
        fillColor: Colors.white.withOpacity(0.2),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.white.withOpacity(0.5),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.white.withOpacity(0.5),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.white.withOpacity(0.5),
          ),
        ),
      ),
    );
  }
}
