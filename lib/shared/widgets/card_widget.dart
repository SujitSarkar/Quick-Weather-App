import 'package:flutter/material.dart';
import '../../core/constants/app_color.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
    required this.child,
    this.contentPadding,
    this.height,
    this.width,
    this.borderRadius = 6,
  });
  final Widget child;
  final EdgeInsetsGeometry? contentPadding;
  final double? height;
  final double? width;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: contentPadding ?? const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.lightCardColor,
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
      ),
      child: child,
    );
  }
}
