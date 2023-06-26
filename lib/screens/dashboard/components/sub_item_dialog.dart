import 'package:admin/constants.dart';
import 'package:admin/models/product_menu_model.dart';
import 'package:admin/res/color.dart';
import 'package:admin/res/txt_style.dart';
import 'package:admin/widgets/btn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

subItemsListDialog(context, {required Items item}) async {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Container(
          width: Get.width / 3,
          child: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Row(
                  children: [
                    Text(
                      item.name ?? '',
                      style: AppText.bodyStyle1(
                        size: 18,
                        color: AppColor.rainbow7,
                      ),
                    ),
                    Spacer(),
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(Icons.close))
                  ],
                ),
                Divider(
                  thickness: 1,
                ),
                SizedBox(height: 20),
                GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 1,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    crossAxisSpacing: defaultPadding,
                    mainAxisSpacing: defaultPadding,
                    childAspectRatio: 1.3,
                  ),
                  itemBuilder: (context, index) => Obx(() => InkWell(
                        onTap: () {
                          item.isSelected.value = !item.isSelected.value;
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          decoration: BoxDecoration(
                            color: item.isSelected.value
                                ? AppColor.primary
                                : AppColor.rainbow7,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text("Small",
                                  style: AppText.bodyStyle1(
                                    color: AppColor.rainbow6,
                                  )),
                              SizedBox(height: 5),
                              Text("₹ 500",
                                  style: AppText.bodyStyle1(
                                    color: AppColor.rainbow6,
                                  ))
                            ],
                          ),
                        ),
                      )),
                ),
                SizedBox(height: 20),
                Divider(
                  thickness: 1,
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomButton(
                      title: "Cancel",
                      curve: 5,
                      height: 35,
                      length: 100,
                      hasBorder: true,
                      textColor: AppColor.rainbow7,
                      color: AppColor.primary,
                      onTap: () {
                        Get.back();
                      },
                    ),
                    SizedBox(width: 15),
                    CustomButton(
                      title: "Save",
                      curve: 5,
                      height: 35,
                      length: 100,
                      color: AppColor.primary,
                      onTap: () {
                        Get.back();
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    },
  );
}
