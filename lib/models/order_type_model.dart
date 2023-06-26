import 'package:admin/controllers/order_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum OrderType {
  DineIn("Dine In"),
  Delivery("Delivery"),
  PickUp("Pick Up");

  final String value;
  const OrderType(this.value);

  //OrderType.Delivery.toString() == "Delivery"
  @override
  String toString() {
    super.toString();
    return value;
  }
}

abstract class OrderTypeModel {
  late OrderType orderType;
  List<Widget> orderDetailsButtons = [];
  List<Widget> expandedWidget = [];
  int selectedButtonIndex = -1;
}
