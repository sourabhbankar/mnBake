import 'package:admin/controllers/order_controller.dart';
import 'package:admin/models/order_type_model.dart';
import 'package:admin/res/color.dart';
import 'package:admin/res/txt_style.dart';
import 'package:admin/screens/dashboard/components/comment_dialog.dart';
import 'package:admin/screens/grid/grid.dart';
import 'package:admin/widgets/btn.dart';
import 'package:easy_container/easy_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group_radio_button/group_radio_button.dart';

import '../../../constants.dart';

class RightSection extends StatefulWidget {
  const RightSection({
    Key? key,
  }) : super(key: key);

  @override
  State<RightSection> createState() => _RightSectionState();
}

class _RightSectionState extends State<RightSection> {
  double _animatedHeight = 400.0;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(
        init: OrderController(),
        builder: (ctrl) {
          return Container(
            padding: EdgeInsets.all(defaultPadding),
            decoration: BoxDecoration(
              color: Theme.of(context).canvasColor,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 40,
                  width: Get.width * 0.4,
                  child: OrderTypeRow(),
                ),
                SizedBox(
                  height: 4,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: ctrl.selectedOrderType.orderDetailsButtons
                        .map((btn) => btn)
                        .toList()
                    //  [

                    //   Row(
                    //     children: [
                    //       EasyContainer(
                    //         padding: 16,
                    //         onTap: () {
                    //           setState(() {
                    //             _animatedHeight != 0.0
                    //                 ? _animatedHeight = 0.0
                    //                 : _animatedHeight = 100.0;
                    //           });
                    //         },
                    //         elevation: 0,
                    //         margin: 2,
                    //         child: Icon(Icons.table_bar_outlined),
                    //       ),
                    //       EasyContainer(
                    //         padding: 16,
                    //         onTap: () {
                    //           setState(() {
                    //             _animatedHeight != 0.0
                    //                 ? _animatedHeight = 0.0
                    //                 : _animatedHeight = 100.0;
                    //           });
                    //         },
                    //         elevation: 0,
                    //         margin: 2,
                    //         child: Icon(Icons.person_outline_sharp),
                    //       ),
                    //       EasyContainer(
                    //         padding: 16,
                    //         onTap: () {
                    //           setState(() {
                    //             _animatedHeight != 0.0
                    //                 ? _animatedHeight = 0.0
                    //                 : _animatedHeight = 100.0;
                    //           });
                    //         },
                    //         elevation: 0,
                    //         margin: 2,
                    //         child: Icon(Icons.group_outlined),
                    //       ),
                    //       EasyContainer(
                    //         padding: 16,
                    //         onTap: () {
                    //           setState(() {
                    //             _animatedHeight != 0.0
                    //                 ? _animatedHeight = 0.0
                    //                 : _animatedHeight = 100.0;
                    //           });
                    //         },
                    //         elevation: 0,
                    //         margin: 2,
                    //         child: IconButton(
                    //             onPressed: () {
                    //               showCommentDialog(context);
                    //             },
                    //             icon: Icon(Icons.edit_calendar)),
                    //       ),
                    //     ],
                    //   ),
                    //   EasyContainer(child: Text(ctrl.orderType.toString()))
                    // ],
                    ),
                if (ctrl.selectedOrderType.selectedButtonIndex != -1)
                  new AnimatedContainer(
                    duration: const Duration(milliseconds: 120),
                    child: ctrl.selectedOrderType.expandedWidget[
                        ctrl.selectedOrderType.selectedButtonIndex],
                    height: ctrl.expandedHeight,
                    color: Colors.tealAccent,
                    width: Get.width * 0.4,
                  ),
                // Text(
                //   "Storage Details",
                //   style: TextStyle(
                //     fontSize: 18,
                //     fontWeight: FontWeight.w500,
                //   ),
                // ),
                SizedBox(height: defaultPadding),

                SizedBox(
                    width: Get.width * 0.4,
                    height: Get.height * 0.45,
                    child: PlutoGridExamplePage()),
                SizedBox(height: defaultPadding),

                //

                /// Draggable part
                Obx(() => AnimatedSize(
                      duration: Duration(milliseconds: 400),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              ctrl.showPayment.value = !ctrl.showPayment.value;
                            },
                            child: Container(
                              width: Get.width * 0.05,
                              color: Colors.black87,
                              child: Icon(
                                ctrl.showPayment.value
                                    ? Icons.arrow_drop_down_rounded
                                    : Icons.arrow_drop_up_rounded,
                                color: AppColor.rainbow6,
                              ),
                            ),
                          ),
                          Container(
                            width: Get.width * 0.4,
                            color: Colors.black87,
                            child: Column(children: [
                              Padding(
                                padding: const EdgeInsets.all(15),
                                child: Row(
                                  children: [
                                    CustomButton(
                                      title: "Split",
                                      curve: 5,
                                      height: 35,
                                      length: 95,
                                      color: AppColor.primary,
                                      onTap: () {
                                        Get.back();
                                      },
                                    ),
                                    SizedBox(width: 15),
                                    CustomButton(
                                      title: "Advance Order",
                                      curve: 5,
                                      height: 35,
                                      length: 190,
                                      color: AppColor.primary,
                                      onTap: () {
                                        Get.back();
                                      },
                                    ),
                                    Spacer(),
                                    Text(
                                      "Total ",
                                      style: AppText.bodyStyle1(
                                          color: AppColor.rainbow6),
                                    ),
                                    Text(
                                      "835",
                                      style: AppText.bodyStyle1(
                                          color: AppColor.beach4),
                                    ),
                                  ],
                                ),
                              ),

                              //
                              if (ctrl.showPayment.value) ...[
                                Theme(
                                    data: Theme.of(context).copyWith(
                                      unselectedWidgetColor: AppColor.grey,
                                    ),
                                    child: Obx(
                                      () => Container(
                                        color: AppColor.lightGrey,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15.0),
                                        child: RadioGroup<String>.builder(
                                          activeColor: AppColor.primary,
                                          direction: Axis.horizontal,
                                          groupValue: ctrl.paymentType.value,
                                          horizontalAlignment:
                                              MainAxisAlignment.spaceAround,
                                          onChanged: (value) => ctrl
                                              .paymentType.value = value ?? '',
                                          items: ctrl.paymentOptions,
                                          textStyle: TextStyle(
                                            fontSize: 15,
                                            color: AppColor.grey,
                                          ),
                                          itemBuilder: (item) =>
                                              RadioButtonBuilder(
                                            item,
                                          ),
                                        ),
                                      ),
                                    )),
                                SizedBox(height: 15),
                                Obx(() => Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Theme(
                                          data: ThemeData(
                                              unselectedWidgetColor:
                                                  AppColor.grey),
                                          child: Checkbox(
                                            value: ctrl.isPaid.value,
                                            onChanged: (val) => ctrl.isPaid
                                                .value = !ctrl.isPaid.value,
                                          ),
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          "It's Paid",
                                          style: AppText.bodyStyle1(
                                              color: AppColor.rainbow6),
                                        ),
                                      ],
                                    )),
                                SizedBox(height: 15),
                              ],
                            ]),
                          ),
                        ],
                      ),
                    )),
                SizedBox(height: defaultPadding),
                Container(
                  height: 60,
                  width: Get.width * 0.4,
                  child: SaveRow(),
                ),
              ],
            ),
          );
        });
  }

  Row OrderTypeRow() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: EasyContainer(
            margin: 0,
            elevation: 0,
            customPadding:
                EdgeInsets.only(left: 8, right: 8, top: 0, bottom: 0),
            child: Text(
              'Dine in',
              style: TextStyle(color: Colors.white),
            ),
            color: OrderController.instance.orderType == OrderType.DineIn
                ? AppColor.primary
                : Colors.grey[900],
          ),
        ),
        SizedBox(
          width: 1,
        ),
        Expanded(
          child: EasyContainer(
            margin: 0,
            color: OrderController.instance.orderType == OrderType.Delivery
                ? AppColor.primary
                : Colors.grey[900],
            elevation: 0,
            customPadding:
                EdgeInsets.only(left: 8, right: 8, top: 0, bottom: 0),
            child: Text(
              'Delivery',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        SizedBox(
          width: 1,
        ),
        Expanded(
          child: EasyContainer(
            margin: 0,
            color: OrderController.instance.orderType == OrderType.PickUp
                ? AppColor.primary
                : Colors.grey[900],
            elevation: 0,
            customPadding:
                EdgeInsets.only(left: 8, right: 8, top: 0, bottom: 0),
            child: Text(
              'Pick up',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  Row SaveRow() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: EasyContainer(
            customMargin: EdgeInsets.only(left: 8, right: 8),
            elevation: 0,
            customPadding:
                EdgeInsets.only(left: 8, right: 8, top: 0, bottom: 0),
            child: Text(
              'Save',
              style: TextStyle(color: Colors.white),
            ),
            color: AppColor.primary,
          ),
        ),
        Expanded(
          child: EasyContainer(
            customMargin: EdgeInsets.only(left: 8, right: 8),
            elevation: 0,
            customPadding:
                EdgeInsets.only(left: 8, right: 8, top: 0, bottom: 0),
            child: Text(
              'Save & Print',
              style: TextStyle(color: Colors.white),
            ),
            color: AppColor.primary,
          ),
        ),
        Expanded(
          child: EasyContainer(
            customMargin: EdgeInsets.only(left: 8, right: 8),
            elevation: 0,
            customPadding:
                EdgeInsets.only(left: 8, right: 8, top: 0, bottom: 0),
            child: Text(
              'Save & eBill',
              style: TextStyle(color: Colors.white),
            ),
            color: AppColor.primary,
          ),
        ),
        Expanded(
          child: EasyContainer(
            customMargin: EdgeInsets.only(left: 8, right: 8),
            color: Colors.grey[900],
            elevation: 0,
            customPadding:
                EdgeInsets.only(left: 8, right: 8, top: 0, bottom: 0),
            child: Text(
              'KOT',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        SizedBox(
          width: 1,
        ),
        Expanded(
          child: EasyContainer(
            customMargin: EdgeInsets.only(left: 8, right: 8),
            color: Colors.grey[900],
            elevation: 0,
            customPadding:
                EdgeInsets.only(left: 8, right: 8, top: 0, bottom: 0),
            child: Text(
              'KOT and Print',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        SizedBox(
          width: 1,
        ),
        Expanded(
          child: EasyContainer(
            customMargin: EdgeInsets.only(left: 8, right: 8),
            color: Colors.grey[900],
            elevation: 0,
            customPadding:
                EdgeInsets.only(left: 8, right: 8, top: 0, bottom: 0),
            child: Text(
              'Hold',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
