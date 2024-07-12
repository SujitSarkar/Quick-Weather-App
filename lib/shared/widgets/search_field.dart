import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/app_color.dart';
import '../../features/weather/controller/weather_controller.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return GetBuilder<WeatherController>(builder: (controller) {
      return TextFormField(
        controller: controller.cityController,
        keyboardType: TextInputType.text,
        textAlign: TextAlign.start,
        onChanged: (value) {
          controller.debouncing(fn: () {
            controller.update();
          });
        },
        onEditingComplete: () {
          if (controller.cityController.text.isNotEmpty) {
            controller.searchOnTap();
          }
        },
        style: const TextStyle(
            color: AppColors.lightTextColor,
            fontWeight: FontWeight.w400,
            fontSize: 16),
        decoration: InputDecoration(
          suffixIcon: controller.cityController.text.isNotEmpty
              ? InkWell(
                  onTap: () {
                    controller.clearSearch();
                  },
                  child: const Icon(
                    Icons.close,
                    color: AppColors.lightSecondaryTextColor,
                  ).paddingOnly(right: 12),
                )
              : null,
          suffixIconConstraints: BoxConstraints.loose(size),
          prefixIconConstraints: BoxConstraints.loose(size),
          fillColor: AppColors.lightSearchFillColor,
          filled: true,
          alignLabelWithHint: true,
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide.none),
          enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide.none),
          focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide.none),
          errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide.none),
          isDense: true,
          contentPadding: const EdgeInsets.all(12),
          floatingLabelAlignment: FloatingLabelAlignment.start,
          hintText: 'Search city',
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          hintStyle: const TextStyle(
              color: AppColors.lightSecondaryTextColor,
              fontWeight: FontWeight.w300,
              fontSize: 16),
        ),
      );
    });
  }
}
