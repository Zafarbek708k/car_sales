import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

import '../style/colors.dart';

class ShimmerTextWidget extends StatelessWidget {
  final String text;
  final Color shimmerBaseColor;
  final Color shimmerHighlightColor;
  final Color? textColor;
  final Color? backgroundColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final TextDecoration? textDecoration;
  final double? decorationThickness;
  final TextOverflow? textOverflow;
  final int? maxLine;
  final bool? softWrap;
  final double? wordSpacing;
  final double? height;
  final double? letterSpacing;
  final String? fontFamily;
  final FontStyle fontStyle;

  const ShimmerTextWidget(
      this.text, {
        super.key,
        this.textColor = Colors.white,
        this.backgroundColor,
        this.fontSize = 16,
        this.fontWeight = FontWeight.normal,
        this.textAlign = TextAlign.start,
        this.textDecoration = TextDecoration.none,
        this.decorationThickness,
        this.textOverflow = TextOverflow.clip,
        this.maxLine,
        this.softWrap,
        this.wordSpacing,
        this.height = 1.25,
        this.letterSpacing,
        this.fontFamily,
        this.fontStyle = FontStyle.normal,
        this.shimmerBaseColor = AppColors.black,
        this.shimmerHighlightColor = AppColors.primaryColor,
      });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: shimmerBaseColor,
      highlightColor: shimmerHighlightColor,
      child: Text(text,
        textAlign: textAlign,
        overflow: textOverflow,
        maxLines: maxLine,
        softWrap: softWrap,
        style: GoogleFonts.montserrat(
          textStyle: TextStyle(
            color: textColor,
            backgroundColor: backgroundColor,
            fontFamily: fontFamily,
            fontSize: fontSize,
            fontWeight: fontWeight,
            fontStyle: fontStyle,
            decoration: textDecoration,
            decorationThickness: decorationThickness,
            wordSpacing: wordSpacing,
            height: height,
            letterSpacing: letterSpacing,
          ),
        ),),
    );
  }
}
