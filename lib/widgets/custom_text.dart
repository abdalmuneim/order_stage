import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:orderstage/core/resources/font_manager.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    Key? key,
    required this.text,
    this.fontSize = 18,
    this.textAlign,
    this.style,
    this.backgroundColor,
    this.color = Colors.black,
    this.fontWeight = FontWeightManager.regular,
    this.maxLines,
    this.textDecoration,
    this.overflow,
  }) : super(key: key);
  final String text;
  final TextStyle? style;
  final double? fontSize;
  final int? maxLines;
  final Color? color;
  final Color? backgroundColor;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final TextOverflow? overflow;
  final TextDecoration? textDecoration;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style ??
          GoogleFonts.almarai(
              fontSize: fontSize,
              color: color,
              fontWeight: fontWeight,
              backgroundColor: backgroundColor,
              decoration: textDecoration),
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
    );
  }
}
