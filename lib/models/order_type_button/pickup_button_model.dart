import 'package:admin/controllers/order_controller.dart';
import 'package:admin/models/order_type_model.dart';
import 'package:admin/screens/order_details_buttons/customer_details_view.dart';
import 'package:admin/screens/order_details_buttons/order_comments_view.dart';
import 'package:flutter/material.dart';

class PickUpOrderTypeModel implements OrderTypeModel {
  @override
  OrderType orderType = OrderType.PickUp;

  @override
  List<Widget> orderDetailsButtons = [
    CustomerDetailsButton(
      index: 0,
    ),
    OrderCommentsButtonView()
  ];

  @override
  List<Widget> expandedWidget = [CustomerDetailsButtonExpanded()];

  @override
  int selectedButtonIndex = 0;
}
