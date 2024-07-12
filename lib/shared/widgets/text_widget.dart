import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/constants/app_color.dart';

class TitleText extends StatelessWidget {
  const TitleText(
      {super.key,
      required this.text,
      this.textAlign = TextAlign.left,
      this.textColor,
      this.overflow,
      this.textsize,
      this.fontFamily});
  final String text;
  final TextAlign textAlign;
  final Color? textColor;
  final double? textsize;
  final TextOverflow? overflow;
  final String? fontFamily;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: textsize ?? 20.sp,
          overflow: overflow,
          fontFamily: fontFamily,
          color: textColor ?? AppColors.lightTextColor),
    );
  }
}

class BodyText extends StatelessWidget {
  const BodyText(
      {super.key,
      required this.text,
      this.textAlign = TextAlign.left,
      this.textColor,
      this.overflow,
      this.maxLine,
      this.textsize,
      this.fontWeight});
  final String text;
  final TextAlign textAlign;
  final Color? textColor;
  final double? textsize;
  final TextOverflow? overflow;
  final int? maxLine;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLine,
      style: TextStyle(
          fontWeight: fontWeight ?? FontWeight.w400,
          fontSize: textsize ?? 14.sp,
          color: textColor ?? AppColors.lightTextColor),
    );
  }
}

class SmallText extends StatelessWidget {
  const SmallText(
      {super.key,
      required this.text,
      this.textAlign = TextAlign.left,
      this.textColor,
      this.overflow,
      this.maxLine,
      this.textsize,
      this.fontWeight});
  final String text;
  final TextAlign textAlign;
  final Color? textColor;
  final double? textsize;
  final TextOverflow? overflow;
  final int? maxLine;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLine,
      style: TextStyle(
        fontWeight: fontWeight ?? FontWeight.w400,
        fontSize: 12.sp,
        color: textColor ?? AppColors.lightTextColor,
      ),
    );
  }
}
