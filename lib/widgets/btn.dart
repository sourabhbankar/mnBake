import 'package:admin/res/color.dart';
import 'package:admin/res/decoration.dart';
import 'package:admin/res/txt_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class CustomButton extends StatefulWidget {
  final Function()? onTap;
  final String title;
  final BoxDecoration? decoration;
  final double? height;
  final double? length;
  final TextStyle? titleStyle;
  final bool loading;
  final bool icon;
  final bool gradientBox;
  final int? shadowIndex;
  final String? logo;
  final double? curve;
  final Color? color;
  final Color? loaderColor;
  final Color? iconColor;
  final IconData? iconData;
  final FocusNode? focus;
  final Color? textColor;
  final bool? hasBorder;

  const CustomButton({
    this.logo,
    this.onTap,
    required this.title,
    this.decoration,
    this.height,
    this.length,
    this.titleStyle,
    this.loading = false,
    this.gradientBox = false,
    this.shadowIndex,
    this.color,
    this.loaderColor,
    this.curve,
    this.focus,
    this.iconData,
    this.icon = false,
    this.iconColor,
    Key? key,
    this.textColor,
    this.hasBorder = false,
  }) : super(key: key);

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      focusNode: widget.focus,
      onTap: widget.loading ? null : widget.onTap,
      child: Container(
          height: widget.height ?? 50,
          width: widget.length ?? Get.width,
          decoration: boxDecoration(),
          child: widget.loading
              ? SpinKitThreeBounce(
                  color: AppColor.primary,
                  size: 20.0,
                )
              : widget.logo == null && widget.icon == false
                  ? Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          widget.title,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: widget.titleStyle ??
                              AppText.bodyStyle1(
                                  size: 18,
                                  color: widget.textColor ?? Colors.white),
                        ),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (widget.logo != null)
                            Padding(
                              padding: const EdgeInsets.only(right: 12.0),
                              child: Image(
                                image: AssetImage(widget.logo!),
                                width: 30,
                                height: 30,
                              ),
                            ),
                          Text(
                            widget.title,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: widget.titleStyle ??
                                AppText.bodyStyle1(
                                    size: 18, color: Colors.white),
                          ),
                          if (widget.icon == true)
                            CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.white,
                              child: Icon(
                                widget.iconData,
                                size: 18,
                                color: widget.iconColor,
                              ),
                            ),
                        ],
                      ),
                    )),
    );
  }

  BoxDecoration boxDecoration() {
    if (widget.onTap == null || widget.loading) {
      return AppDecoration.filledDecoration(
          color: AppColor.grey, curve: widget.curve);
    } else if (widget.gradientBox == true) {
      return BoxDecoration(
          borderRadius: BorderRadius.circular(widget.curve ?? 12),
          gradient:
              AppDecoration.gradientColor(index: widget.shadowIndex ?? 7));
    } else if (widget.hasBorder!) {
      return AppDecoration.outlineDecoration(
          color: AppColor.primary, curve: widget.curve);
    } else {
      return AppDecoration.filledDecoration(
          curve: widget.curve, color: widget.color);
    }
  }
}
