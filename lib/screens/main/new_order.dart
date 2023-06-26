import 'package:admin/controllers/order_controller.dart';
import 'package:admin/models/order_type_model.dart';
import 'package:admin/res/color.dart';
import 'package:admin/res/txt_style.dart';
import 'package:admin/widgets/btn.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewOrder extends StatelessWidget {
  const NewOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.rainbow6,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Text(
                  "Table View",
                  style: AppText.headingStyle3(
                      color: AppColor.lightGrey, size: 15),
                ),
                Spacer(),
                CustomButton(
                  title: "Delivery",
                  curve: 5,
                  height: 35,
                  length: 130,
                  color: AppColor.red,
                  onTap: () {
                    OrderController.instance.setOrderType = OrderType.Delivery;
                    Get.back();
                  },
                ),
                SizedBox(
                  width: 20,
                ),
                CustomButton(
                  title: "Pickup",
                  curve: 5,
                  height: 35,
                  length: 130,
                  color: AppColor.red,
                  onTap: () {
                    OrderController.instance.setOrderType = OrderType.PickUp;
                    Get.back();
                  },
                ),
                SizedBox(
                  width: 20,
                ),
                CustomButton(
                  title: "+ Add Table",
                  curve: 5,
                  height: 35,
                  length: 150,
                  color: AppColor.red,
                  onTap: () {
                    Get.to(() => NewOrder());
                  },
                ),
                SizedBox(
                  width: 20,
                ),
              ],
            ),
          ),
          Divider(
            color: AppColor.grey,
          ),
          SizedBox(
            width: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Wrap(
                  alignment: WrapAlignment.start,
                  children: List.generate(
                      5,
                      (index) => Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: InkWell(
                              onTap: () {
                                OrderController.instance.setOrderType =
                                    OrderType.DineIn;
                                Get.back();
                              },
                              child: Column(
                                children: [
                                  DottedBorder(
                                    color: Colors.black,
                                    strokeWidth: 1,
                                    child: Container(
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        color: AppColor.grey,
                                        // borderRadius: BorderRadius.circular(10),
                                      ),
                                      height: 100,
                                      width: 100,
                                      child: Center(
                                        child: Text(
                                          "${index + 1}",
                                          style: AppText.bodyStyle1(
                                            color: AppColor.rainbow7,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                ],
                              ),
                            ),
                          ))),
            ),
          )
        ],
      ),
    );
  }
}
