import 'package:admin/controllers/cart_controller.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class MiddleSectionController extends GetxController {
  int selectedTitleIndex = 0;

  keyboardEvent(LogicalKeyboardKey key) {
    final cartController = CartController.instance;
    if (key == LogicalKeyboardKey.enter) {
      cartController
          .addProductToCart(cartController.getMenu.items![selectedTitleIndex]);
    }
    if (key == LogicalKeyboardKey.arrowLeft && selectedTitleIndex > 0) {
      selectedTitleIndex -= 1;
    } else if (key == LogicalKeyboardKey.arrowRight &&
        selectedTitleIndex < cartController.getMenu.items!.length - 1) {
      selectedTitleIndex += 1;
    } else if (key == LogicalKeyboardKey.arrowUp && selectedTitleIndex > 3) {
      selectedTitleIndex -= 4;
    } else if (key == LogicalKeyboardKey.arrowDown) {
      if (selectedTitleIndex + 4 >= cartController.getMenu.items!.length) {
          selectedTitleIndex = cartController.getMenu.items!.length -1;
      } else {
        selectedTitleIndex += 4;
      }
    }
    print("value is " + selectedTitleIndex.toString());
    update();
  }
}
