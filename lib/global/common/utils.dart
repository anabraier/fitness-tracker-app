import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


void showSnackBar(BuildContext context, String message) {
  final snackBar = SnackBar(
    content: Text(message),
    duration: const Duration(seconds: 3),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

TextStyle textStyle(double size, [Color color=Colors.black, FontWeight fw=FontWeight.w600]) {
  return GoogleFonts.montserrat(
    fontSize: size,
    color: color,
    fontWeight: fw
  );}