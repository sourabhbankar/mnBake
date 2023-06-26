import 'package:admin/controllers/order_controller.dart';
import 'package:easy_container/easy_container.dart';
import 'package:flutter/material.dart';

class NoOfPersonsButtoView extends StatelessWidget {
  const NoOfPersonsButtoView({Key? key, required this.index}) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    return EasyContainer(
      padding: 16,
      onTap: () {
        if (OrderController.instance.selectedOrderType.selectedButtonIndex ==
            index) {
          OrderController.instance.selectedOrderType.selectedButtonIndex = -1;
        } else {
          OrderController.instance.selectedOrderType.selectedButtonIndex =
              index;
        }

        OrderController.instance.expandedHeight = 110;
        OrderController.instance.update();

        // setState(() {
        //   _animatedHeight != 0.0
        //       ? _animatedHeight = 0.0
        //       : _animatedHeight = 100.0;
        // });
      },
      elevation: 0,
      margin: 2,
      child: Icon(Icons.group_outlined),
    );
  }
}

class NoOfPersonsButtoViewExpanded extends StatelessWidget {
  const NoOfPersonsButtoViewExpanded({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(24),
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              label: Text('Number of persons'),
            ),
          ),
        ],
      ),
    );
  }
}
