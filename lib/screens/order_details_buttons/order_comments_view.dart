import 'package:admin/controllers/order_controller.dart';
import 'package:admin/screens/dashboard/components/comment_dialog.dart';
import 'package:easy_container/easy_container.dart';
import 'package:flutter/material.dart';

class OrderCommentsButtonView extends StatelessWidget {
  const OrderCommentsButtonView({Key? key, })
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return EasyContainer(
      padding: 16,
      onTap: () {
        showCommentDialog(context);

        // OrderController.instance.expandedHeight = 110;
        // OrderController.instance.update();

        // setState(() {
        //   _animatedHeight != 0.0
        //       ? _animatedHeight = 0.0
        //       : _animatedHeight = 100.0;
        // });
      },
      elevation: 0,
      margin: 2,
      child: Icon(Icons.edit_calendar),
    );
  }
}
