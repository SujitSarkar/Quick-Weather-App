part of 'widget_imports.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key, this.color, this.value});
  final Color? color;
  final double? value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24,
      width: 24,
      child: kIsWeb || Platform.isAndroid
          ? CircularProgressIndicator(
              color: color ?? AppColors.primaryColor,
              value: value,
            )
          : Platform.isIOS
              ? CupertinoActivityIndicator(
                  color: color ?? AppColors.primaryColor)
              : CircularProgressIndicator(
                  color: color ?? AppColors.primaryColor,
                ),
    );
  }
}
