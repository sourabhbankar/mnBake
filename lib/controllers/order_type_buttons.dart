import 'package:admin/models/order_type_model.dart';
import 'package:easy_container/easy_container.dart';
import 'package:flutter/material.dart';

import 'order_controller.dart';

class OrderTypeButtons {
  static const Map<OrderType, List<Widget>> buttons = {
    OrderType.Delivery: [CustomerDetailsOrderButton()]
  };
}

class CustomerDetailsOrderButton extends StatelessWidget {
  const CustomerDetailsOrderButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EasyContainer(
      padding: 16,
      onTap: () {
        // setState(() {
        //   _animatedHeight != 0.0
        //       ? _animatedHeight = 0.0
        //       : _animatedHeight = 100.0;
        // });
      },
      elevation: 0,
      margin: 2,
      child: Icon(Icons.person_outline_sharp),
    );
  }
}
