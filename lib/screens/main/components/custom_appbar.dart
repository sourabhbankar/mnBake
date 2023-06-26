import 'package:admin/controllers/order_controller.dart';
import 'package:admin/res/color.dart';
import 'package:admin/res/txt_style.dart';
import 'package:admin/screens/main/new_order.dart';
import 'package:admin/widgets/btn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(color: AppColor.rainbow7),
      backgroundColor: AppColor.rainbow6,
      centerTitle: false,
      title: Row(
        children: [
          Text(
            "mnBake",
            style: AppText.headingStyle2(size: 25),
          ),
          SizedBox(width: 15),
          CustomButton(
            title: "New Order",
            curve: 5,
            height: 35,
            length: 130,
            color: AppColor.primary,
            onTap: () {
              OrderController.instance.selectedOrderType.selectedButtonIndex = -1;
              Get.to(() => NewOrder());
            },
          )
        ],
      ),
    );
  }
}
