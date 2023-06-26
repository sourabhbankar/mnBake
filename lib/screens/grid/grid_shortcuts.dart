import 'package:admin/controllers/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pluto_grid/pluto_grid.dart';

/// shortcut: PlutoGridShortcut(
///   actions: {
///     ...PlutoGridShortcut.defaultActions,
///     LogicalKeySet(LogicalKeyboardKey.enter): CustomEnterKeyAction(),
///   },
/// ),
///
class GridKeyIPressed extends PlutoGridShortcutAction {
  @override
  void execute({
    required PlutoKeyManagerEvent keyEvent,
    required PlutoGridStateManager stateManager,
  }) {
    print('heey');
    CartController.instance.incrementQtyOfItem();
  }
}

class GridKeyDPressed extends PlutoGridShortcutAction {
  @override
  void execute({
    required PlutoKeyManagerEvent keyEvent,
    required PlutoGridStateManager stateManager,
  }) {
    print('heey');
    CartController.instance.decrementQtyOfItem();
  }
}

class GridKeyDelPressed extends PlutoGridShortcutAction {
  @override
  void execute({
    required PlutoKeyManagerEvent keyEvent,
    required PlutoGridStateManager stateManager,
  }) {
    print('heey');
    stateManager.removeCurrentRow();
    // CartController.instance.decrementQtyOfItem();
  }
}

class GridKeyf2Pressed extends PlutoGridShortcutAction {
  @override
  void execute({
    required PlutoKeyManagerEvent keyEvent,
    required PlutoGridStateManager stateManager,
  }) {
    print('heey');
    FocusScope.of(stateManager.gridFocusNode.context!).unfocus();
    CartController.instance.keyboardFocusNode.requestFocus();
    // CartController.instance.decrementQtyOfItem();
  }
}
