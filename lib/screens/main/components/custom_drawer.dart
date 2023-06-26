import 'package:admin/res/color.dart';
import 'package:admin/res/txt_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        backgroundColor: AppColor.rainbow7,
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            ListTile(
              title: Row(
                children: [
                  Text(
                    ' Settings ',
                    style:
                        AppText.bodyStyle1(size: 22, color: AppColor.rainbow6),
                  ),
                  Spacer(),
                  Icon(Icons.arrow_back, size: 25, color: AppColor.rainbow6)
                ],
              ),
              onTap: () {
                Get.back();
              },
            ),
            SizedBox(height: 20),
            ListTile(
              leading: Icon(Icons.person, color: AppColor.rainbow6),
              title: Text(
                ' Billing ',
                style: AppText.bodyStyle1(color: AppColor.rainbow6),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.book, color: AppColor.rainbow6),
              title: Text(
                ' Configuration ',
                style: AppText.bodyStyle1(color: AppColor.rainbow6),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.workspace_premium, color: AppColor.rainbow6),
              title: Text(
                ' Reports ',
                style: AppText.bodyStyle1(color: AppColor.rainbow6),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.video_label, color: AppColor.rainbow6),
              title: Text(
                ' Live View ',
                style: AppText.bodyStyle1(color: AppColor.rainbow6),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.edit, color: AppColor.rainbow6),
              title: Text(
                ' Check Updates ',
                style: AppText.bodyStyle1(color: AppColor.rainbow6),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.logout, color: AppColor.rainbow6),
              title: Text(
                ' Logout ',
                style: AppText.bodyStyle1(color: AppColor.rainbow6),
              ),
              onTap: () {},
            ),
            Divider(thickness: 2, color: AppColor.rainbow6),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Text(
                    "Ref ID : A97611R",
                    style: AppText.bodyStyle1(color: AppColor.rainbow6),
                  ),
                  Spacer(),
                  Text(
                    "Version : 105.1.1",
                    style: AppText.bodyStyle1(color: AppColor.rainbow6),
                  ),
                ],
              ),
            ),
            Divider(thickness: 2, color: AppColor.rainbow6),
            Center(
              child: Text(
                "Bill Name : Jagbir",
                style: AppText.bodyStyle1(color: AppColor.rainbow6),
              ),
            ),
            Divider(thickness: 2, color: AppColor.rainbow6),
          ],
        ),
      ),
    );
  }
}
