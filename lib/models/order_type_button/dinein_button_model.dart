import 'package:admin/controllers/order_controller.dart';
import 'package:admin/models/order_type_model.dart';
import 'package:admin/screens/order_details_buttons/customer_details_view.dart';
import 'package:admin/screens/order_details_buttons/no_of_persons_view.dart';
import 'package:admin/screens/order_details_buttons/order_comments_view.dart';
import 'package:admin/screens/order_details_buttons/table_number_view.dart';
import 'package:flutter/material.dart';

class DineInOrderTypeModel implements OrderTypeModel {
  @override
  OrderType orderType = OrderType.DineIn;

  @override
  List<Widget> orderDetailsButtons = [
    TableNumberButtonView(index: 0),
    CustomerDetailsButton(
      index: 1,
    ),
    NoOfPersonsButtoView(
      index: 2,
    ),
    OrderCommentsButtonView()
  ];

  @override
  List<Widget> expandedWidget = [
    TableNumberButtonViewExpanded(),
    CustomerDetailsButtonExpanded(),
    NoOfPersonsButtoViewExpanded(),
  ];

  @override
  int selectedButtonIndex = -1;
}
