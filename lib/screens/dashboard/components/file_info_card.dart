import 'package:admin/controllers/cart_controller.dart';
import 'package:admin/controllers/middle_section_controller.dart';
import 'package:admin/models/MyFiles.dart';
import 'package:admin/models/product_menu_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../constants.dart';

class FileInfoCard extends StatelessWidget {
  const FileInfoCard({
    Key? key,
    required this.item,
    this.onTap,
  }) : super(key: key);

  final Items item;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MiddleSectionController>(
        init: MiddleSectionController(),
        builder: (ctr) {
          return InkWell(
            onTap: onTap,
            child: Container(
              padding: EdgeInsets.all(defaultPadding),
              decoration: BoxDecoration(
                color: Theme.of(context).canvasColor,
                border: Border.all(color: ctr.selectedTitleIndex == CartController.instance.getMenu.items?.indexOf(item) ?  Colors.red : Colors.transparent),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    item.name ?? '',
                    style: TextStyle(fontSize: 14),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          );
        });
  }
}

class ProgressLine extends StatelessWidget {
  const ProgressLine({
    Key? key,
    this.color = primaryColor,
    required this.percentage,
  }) : super(key: key);

  final Color? color;
  final int? percentage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 5,
          decoration: BoxDecoration(
            color: color!.withOpacity(0.1),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        LayoutBuilder(
          builder: (context, constraints) => Container(
            width: constraints.maxWidth * (percentage! / 100),
            height: 5,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
        ),
      ],
    );
  }
}
