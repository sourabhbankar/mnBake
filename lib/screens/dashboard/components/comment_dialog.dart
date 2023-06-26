import 'package:admin/res/color.dart';
import 'package:admin/res/txt_style.dart';
import 'package:admin/widgets/btn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

showCommentDialog(context) async {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Container(
          width: Get.width / 4,
          child: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Row(
                  children: [
                    Text(
                      "Order wise comments",
                      style: AppText.bodyStyle1(
                        size: 18,
                        color: AppColor.rainbow7,
                      ),
                    ),
                    // Spacer(),
                    // IconButton(
                    //     onPressed: () {
                    //       Navigator.of(context).pop();
                    //     },
                    //     icon: Icon(Icons.close))
                  ],
                ),
                Divider(
                  thickness: 1,
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: TextEditingController(),
                  maxLines: 3,
                  decoration: InputDecoration(
                    labelText: 'Any specific request',
                    border: OutlineInputBorder(),
                  ),
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
