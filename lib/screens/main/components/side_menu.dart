import 'package:admin/controllers/cart_controller.dart';
import 'package:admin/models/product_menu_model.dart';
import 'package:admin/res/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  // DrawerHeader(
  //   child: Image.asset("assets/images/logo.png"),
  // ),
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
          children: productMenu.menu!
              .map((product) => Column(
                    children: [
                      GetBuilder<CartController>(
                          init: CartController(),
                          builder: (context) {
                            return DrawerListTile(
                              title: product.category ?? '',
                              isSelected:
                                  CartController.instance.getMenu.category ==
                                      product.category,
                              svgSrc: "assets/icons/menu_dashbord.svg",
                              press: () {
                                CartController.instance.setMenu = product;
                              },
                            );
                          }),
                      Divider(),
                    ],
                  ))
              .toList()),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    required this.press,
    this.isSelected,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;
  final bool? isSelected;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
        init: CartController(),
        builder: (ctr) {
          return RawKeyboardListener(
            focusNode: FocusNode(),
            onKey: (RawKeyEvent event) {
              if (event.logicalKey == LogicalKeyboardKey.enter) {
                // Handle the enter key press
                print('Enter key pressed!');
                // TODO: Perform the button press action here
              }
            },
            child: ListTile(
              onTap: press,
              selected: isSelected ?? false,
              selectedTileColor: AppColor.primary,
              horizontalTitleGap: 0.0,
              // leading: SvgPicture.asset(
              //   svgSrc,
              //   color: Colors.white54,
              //   height: 16,
              // ),
              title: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(color: isSelected == true ? Colors.white : null),
              ),
            ),
          );
        });
  }
}
