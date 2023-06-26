import 'package:admin/res/color.dart';
import 'package:flutter/material.dart';

class AppDecoration {
  static InputBorder get border1 => OutlineInputBorder(
      borderRadius: BorderRadius.circular(30.0),
      borderSide: const BorderSide(color: Colors.white));

  static InputBorder get border2 => OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(color: Colors.white));

  static InputBorder get border3 =>
      UnderlineInputBorder(borderSide: BorderSide(color: AppColor.beach1));

  static BoxDecoration get appBarDecoration => BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColor.primary1.withOpacity(0.2),
              offset: const Offset(
                5.0,
                15.0,
              ),
              blurRadius: 15.0,
              spreadRadius: 2.0,
            ), //BoxShadow
            BoxShadow(
              color: AppColor.lightGrey,
              offset: const Offset(0.0, 0.0),
              blurRadius: 0.0,
              spreadRadius: 0.0,
            ), //BoxShadow
          ],
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25)),
          gradient:
              LinearGradient(colors: [AppColor.lightGrey, AppColor.lightGrey]));

  static BoxDecoration get bottomDecoration => BoxDecoration(
        color: AppColor.blueBerry1,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 5,
            spreadRadius: 2,
            offset: const Offset(3, -2),
          ),
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(55),
          topRight: Radius.circular(55),
        ),
      );

  static InputBorder border4({Color? color, double? curve}) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(curve ?? 4.0),
        borderSide: BorderSide(color: color ?? AppColor.beach1));
  }

  static BoxDecoration outlineDecoration({Color? color, double? curve}) {
    return BoxDecoration(
      border: Border.all(color: color ?? AppColor.primary, width: 1),
      borderRadius: BorderRadius.circular(curve ?? 30),
    );
  }

  static BoxDecoration filledDecoration(
      {int? index, double? curve, Color? color}) {
    return BoxDecoration(
      color: color ?? AppColor.primary,
      borderRadius: BorderRadius.circular(curve ?? 30),
    );
  }

  static gradientColor({required int index}) {
    List<Color> primaryGrad = [
      AppColor.primary,
      AppColor.rainbow6,
    ];

    List<Color> colorGrad = primaryGrad;
    switch (index) {
      case 1:
        colorGrad = primaryGrad;
        break;

      default:
        colorGrad = primaryGrad;
    }

    return LinearGradient(
        colors: colorGrad,
        begin: Alignment.topLeft,
        end: Alignment.bottomRight);
  }

  List<BoxShadow> get boxTopShadow => [
        BoxShadow(
          color: AppColor.beach1,
          offset: const Offset(
            7.0,
            -7.0,
          ),
          blurRadius: 40.0,
          spreadRadius: 3.0,
        ),
      ];

  List<BoxShadow> get boxBottomShadow => [
        BoxShadow(
          offset: const Offset(0.0, -9),
          color: AppColor.grey,
          blurRadius: 15.0,
          spreadRadius: 15.0,
        ),
      ];
}
