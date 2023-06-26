import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:admin/controllers/cart_controller.dart';
import 'package:admin/responsive.dart';
import 'package:admin/screens/dashboard/components/header.dart';
import 'package:admin/screens/dashboard/components/sub_item_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants.dart';
import 'file_info_card.dart';

class MiddleSection extends StatelessWidget {
  const MiddleSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Text(r
            //   "My Files",
            //   style: Theme.of(context).textTheme.subtitle1,
            // ),
            Expanded(
              child: Row(
                children: [
                  ElevatedButton.icon(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: defaultPadding * 1.5,
                        vertical: defaultPadding /
                            (Responsive.isMobile(context) ? 2 : 1),
                      ),
                    ),
                    onPressed: () {
                      AdaptiveTheme.of(context).toggleThemeMode();
                    },
                    icon: Icon(Icons.ac_unit_sharp),
                    label: Text("Change Theme"),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(child: SearchField()),
                  // ElevatedButton.icon(
                  //   style: TextButton.styleFrom(
                  //     padding: EdgeInsets.symmetric(
                  //       horirzontal: defaultPadding * 1.5,
                  //       vertical: defaultPadding /
                  //           (Responsive.isMobile(context) ? 2 : 1),
                  //     ),
                  //   ),
                  //   onPressed: () {},
                  //   icon: Icon(Icons.add),
                  //   label: Text("Add New"),
                  // ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: defaultPadding),
        Responsive(
          mobile: FileInfoCardGridView(
            crossAxisCount: _size.width < 650 ? 2 : 4,
            childAspectRatio: _size.width < 650 && _size.width > 350 ? 1.3 : 1,
          ),
          tablet: FileInfoCardGridView(),
          desktop: FileInfoCardGridView(
            childAspectRatio: _size.width < 1400 ? 1.1 : 1.9,
          ),
        ),
      ],
    );
  }
}

class FileInfoCardGridView extends StatelessWidget {
  const FileInfoCardGridView({
    Key? key,
    this.crossAxisCount = 4,
    this.childAspectRatio = 1,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: CartController(),
        builder: (context) {
          return GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: CartController.instance.getMenu.items!.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: defaultPadding,
              mainAxisSpacing: defaultPadding,
              childAspectRatio: childAspectRatio,
            ),
            itemBuilder: (context, index) => FileInfoCard(
                onTap: () {
                  print('btn clicked');
                  CartController.instance.addProductToCart(
                      CartController.instance.getMenu.items![index]);
                  subItemsListDialog(context,
                      item: CartController.instance.getMenu.items![index]);
                },
                item: CartController.instance.getMenu.items![index]),
          );
        });
  }
}
