import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppText {
  static TextStyle headingStyle1({double? size, Color? color}) {
    return Theme.of(Get.context!).textTheme.displayLarge!.copyWith(
          fontSize: size,
          color: color,
          fontFamily: "WorkSans",
          fontWeight: FontWeight.bold,
        );
  }

  static TextStyle headingStyle2({double? size, Color? color}) {
    return Theme.of(Get.context!).textTheme.displayMedium!.copyWith(
          fontSize: size,
          color: color,
          fontFamily: "WorkSans",
          fontWeight: FontWeight.bold,
        );
  }

  static TextStyle headingStyle3({double? size, Color? color}) {
    return Theme.of(Get.context!).textTheme.displaySmall!.copyWith(
          fontSize: size,
          color: color,
          fontFamily: "WorkSans",
          fontWeight: FontWeight.w800,
        );
  }

  static TextStyle bodyStyle1({double? size, Color? color}) {
    return Theme.of(Get.context!).textTheme.bodyLarge!.copyWith(
          fontSize: size,
          color: color,
          fontFamily: "WorkSans",
          fontWeight: FontWeight.w500,
        );
  }

  static TextStyle bodyStyle2({double? size, Color? color}) {
    return Theme.of(Get.context!).textTheme.bodyMedium!.copyWith(
          fontSize: size,
          color: color,
          fontFamily: "WorkSans",
          fontWeight: FontWeight.w400,
        );
  }

  static TextStyle subStyle1({double? size, Color? color}) {
    return Theme.of(Get.context!).textTheme.titleMedium!.copyWith(
          fontSize: size,
          color: color,
          fontFamily: "WorkSans",
          fontWeight: FontWeight.w400,
        );
  }

  static TextStyle subStyle2({double? size, Color? color}) {
    return Theme.of(Get.context!).textTheme.titleSmall!.copyWith(
          fontSize: size,
          color: color,
          fontFamily: "WorkSans",
          fontWeight: FontWeight.w300,
        );
  }
}
