import 'package:admin/constants.dart';
import 'package:admin/controllers/cart_controller.dart';
import 'package:admin/controllers/middle_section_controller.dart';
import 'package:elegant_notification/elegant_notification.dart';
import 'package:elegant_notification/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../models/product_menu_model.dart';

class CakeButtonIntentC extends Intent {
  const CakeButtonIntentC();
}

class PastriesButtonIntentP extends Intent {
  const PastriesButtonIntentP();
}

class AngelCakeIntent1 extends Intent {
  const AngelCakeIntent1();
}

class BerryBerryIntentB extends Intent {
  const BerryBerryIntentB();
}

class KeyController extends StatefulWidget {
  const KeyController({required this.child});
  final Widget child;
  @override
  State<KeyController> createState() => _KeyControllerState();
}

class _KeyControllerState extends State<KeyController> {
  int count = 0;

  // Handles the key events from the Focus widget and updates the
  // _message.
  KeyEventResult _handleKeyEvent(FocusNode node, RawKeyEvent event) {
    debugPrint("button pressed: " + event.logicalKey.toString());
    if (event.isKeyPressed(LogicalKeyboardKey.keyB)) {
      CartController.instance.setMenu = Menu.fromJson(menu['menu']![0]);
      // showSuccessNotification(context, tile: 'Cake button pressed');
    } else if (event.isKeyPressed(LogicalKeyboardKey.keyP)) {
      CartController.instance.setMenu = Menu.fromJson(menu['menu']![1]);

      // showSuccessNotification(context, tile: 'Pastery button pressed');
    } else if (event.isKeyPressed(LogicalKeyboardKey.keyC)) {
      CartController.instance.setMenu = Menu.fromJson(menu['menu']![2]);
    } else if (event.isKeyPressed(LogicalKeyboardKey.keyK)) {
      CartController.instance.setMenu = Menu.fromJson(menu['menu']![3]);

      // showSuccessNotification(context, tile: 'Berry Berry Cake button pressed');
    } else if (event.isKeyPressed(LogicalKeyboardKey.arrowUp) ||
        event.isKeyPressed(LogicalKeyboardKey.arrowLeft) ||
        event.isKeyPressed(LogicalKeyboardKey.arrowRight) ||
        event.isKeyPressed(LogicalKeyboardKey.arrowDown) ||
        event.isKeyPressed(LogicalKeyboardKey.enter)) {
      print('called');
      Get.put(MiddleSectionController()).keyboardEvent(event.logicalKey);
    } else if (event.isKeyPressed(LogicalKeyboardKey.digit1) ||
        event.isKeyPressed(LogicalKeyboardKey.digit2) ||
        event.isKeyPressed(LogicalKeyboardKey.digit3) ||
        event.isKeyPressed(LogicalKeyboardKey.digit4) ||
        event.isKeyPressed(LogicalKeyboardKey.digit5) ||
        event.isKeyPressed(LogicalKeyboardKey.digit6) ||
        event.isKeyPressed(LogicalKeyboardKey.digit7) ||
        event.isKeyPressed(LogicalKeyboardKey.digit8) ||
        event.isKeyPressed(LogicalKeyboardKey.digit9) ||
        event.isKeyPressed(LogicalKeyboardKey.digit0)) {
      CartController.instance.addProductToCartUsingKey(event.logicalKey);
    } else if (event.isKeyPressed(LogicalKeyboardKey.keyI)) {
      print('called i');
      CartController.instance.incrementQtyOfItem();
    } else if (event.isKeyPressed(LogicalKeyboardKey.f3)) {
      CartController.instance.setGridFocus(true);
    } else if (event.isKeyPressed(LogicalKeyboardKey.f2)) {
      CartController.instance.keyboardFocusNode.requestFocus();
    }

    return event.logicalKey == LogicalKeyboardKey.keyQ
        ? KeyEventResult.handled
        : KeyEventResult.ignored;
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
        focusNode: CartController.instance.keyboardFocusNode,
        onKey: _handleKeyEvent,
        autofocus: true,
        child: widget.child);
  }
}

showSuccessNotification(BuildContext context,
    {required String tile, String? description}) {
  ElegantNotification.success(
          notificationPosition: NotificationPosition.bottomRight,
          title: Text(
            tile,
            style: Theme.of(context)
                .textTheme
                .headline5
                ?.copyWith(color: Colors.black),
          ),
          description: Text(description ?? ''))
      .show(context);
}
