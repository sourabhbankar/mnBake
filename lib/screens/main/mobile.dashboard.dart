import 'package:admin/controllers/cart_controller.dart';
import 'package:admin/models/product_menu_model.dart';
import 'package:admin/res/color.dart';
import 'package:admin/screens/main/components/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
        init: CartController(),
        initState: (state) {},
        builder: (cartController) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              title: Text("mnBake"),
            ),
            drawer: CustomDrawer(),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 50,
                  width: Get.width,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  color: AppColor.rainbow7,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: productMenu.menu!.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Center(
                          child: InkWell(
                        onTap: () {
                          cartController.setMenu = productMenu.menu![index];
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: cartController.getMenu ==
                                          productMenu.menu![index]
                                      ? AppColor.primary
                                      : Colors.transparent),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 8),
                              child: Text(productMenu.menu![index].category!)),
                        ),
                      ));
                    },
                  ),
                ),
                GridView.count(
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  children: List.generate(
                      cartController.getMenu.items!
                          .length, //this is the total number of cards
                      (index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        color: Colors.blue,
                        child: Center(
                            child: Text(
                                cartController.getMenu.items![index].name!)),
                      ),
                    );
                  }),
                ),
              ],
            ),
          );
        });
  }
}
