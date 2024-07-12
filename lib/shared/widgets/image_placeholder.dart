import 'package:flutter/cupertino.dart';
import '../../core/constants/app_color.dart';

class ImagePlaceholder extends StatelessWidget {
  const ImagePlaceholder({super.key, this.size});
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Icon(
      CupertinoIcons.cloud_sun_fill,
      color: AppColors.primaryColor,
      size: size ?? 36,
    );
  }
}
