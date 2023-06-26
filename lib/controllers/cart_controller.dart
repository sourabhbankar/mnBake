import 'package:admin/constants.dart';
import 'package:admin/controllers/middle_section_controller.dart';
import 'package:admin/models/product_menu_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pluto_grid/pluto_grid.dart';

class CartController extends GetxController {
  static CartController instance = Get.put(CartController());

  /// [PlutoGridStateManager] has many methods and properties to dynamically manipulate the grid.
  /// You can manipulate the grid dynamically at runtime by passing this through the [onLoaded] callback.
  late final PlutoGridStateManager stateManager;
  //bread default selected menu
  Menu _selectedMenu = Menu.fromJson(menu['menu']![0]);
  List<Items> items = [];

  FocusNode keyboardFocusNode = FocusNode();

  @override
  onInit() {
    super.onInit();
    setMenu = productMenu.menu![0];
  }

  incrementQtyOfItem() {
    try {
      debugPrint('key pressed ${stateManager.keyManager}');
      final rowId = stateManager.currentRowIdx;

      debugPrint('rowId: ' + rowId.toString());
      if (rowId == null) return;
      items[rowId].qty = (items[rowId].qty ?? 0) + 1;

      stateManager.changeCellValue(
          stateManager.currentRow!.cells['qty']!, items[rowId].qty,
          force: true);

      // stateManager.row
    } catch (e) {
      debugPrint('rowId: ' + e.toString());
    }
  }

  decrementQtyOfItem() {
    try {
      debugPrint('key pressed ${stateManager.keyManager}');
      final rowId = stateManager.currentRowIdx;

      debugPrint('rowId: ' + rowId.toString());
      if (rowId == null) return;
      if (items[rowId].qty == 1) return;
      items[rowId].qty = (items[rowId].qty ?? 0) - 1;

      stateManager.changeCellValue(
          stateManager.currentRow!.cells['qty']!, items[rowId].qty,
          force: true);

      // stateManager.row
    } catch (e) {
      debugPrint('rowId: ' + e.toString());
    }
  }

  itemsToPlutoRow(List<Items> items) {
    return items
        .map((item) => PlutoRow(cells: {
              'items': PlutoCell(value: item.name),
              'qty': PlutoCell(value: item.qty ?? 1),
              'price': PlutoCell(value: item.price),
            }))
        .toList();
  }

  final List<PlutoRow> cartRows = [
    // PlutoRow(
    //   cells: {
    //     'id': PlutoCell(value: 'user1'),
    //     'name': PlutoCell(value: 'Mike'),
    //     'age': PlutoCell(value: 20),
    //     'role': PlutoCell(value: 'Programmer'),
    //     'joined': PlutoCell(value: '2021-01-01'),
    //     'working_time': PlutoCell(value: '09:00'),
    //     'salary': PlutoCell(value: 300),
    //   },
    // ),
    // PlutoRow(
    //   cells: {
    //     'id': PlutoCell(value: 'user2'),
    //     'name': PlutoCell(value: 'Jack'),
    //     'age': PlutoCell(value: 25),
    //     'role': PlutoCell(value: 'Designer'),
    //     'joined': PlutoCell(value: '2021-02-01'),
    //     'working_time': PlutoCell(value: '10:00'),
    //     'salary': PlutoCell(value: 400),
    //   },
    // ),
    // PlutoRow(
    //   cells: {
    //     'id': PlutoCell(value: 'user3'),
    //     'name': PlutoCell(value: 'Suzi'),
    //     'age': PlutoCell(value: 40),
    //     'role': PlutoCell(value: 'Owner'),
    //     'joined': PlutoCell(value: '2021-03-01'),
    //     'working_time': PlutoCell(value: '11:00'),
    //     'salary': PlutoCell(value: 700),
    //   },
    // ),
  ];

  set setMenu(Menu menu) {
    _selectedMenu = menu;
    Get.put(MiddleSectionController()).selectedTitleIndex = 0;
    Get.put(MiddleSectionController()).update();
    update();
  }

  Menu get getMenu => _selectedMenu;

  setGridFocus(bool value) {
    stateManager.setKeepFocus(value);
    debugPrint('focus ${stateManager.hasFocus}');
  }

  addProductToCart(Items item) {
    try {
      // check if product is already exists and update qty
      if (items.contains(item)) {
        for (int i = 0; i < items.length; i++) {
          if (item.name == items[i].name) {
            items[i].qty = (items[i].qty ?? 0) + 1;

            stateManager.changeCellValue(
                stateManager.rows[i].cells['qty']!, items[i].qty,
                force: true);
            return;
          }
        }
      }

      items.add(item);
      stateManager.appendRows([
        PlutoRow(cells: {
          'items': PlutoCell(value: item.name),
          'qty': PlutoCell(value: item.qty ?? 1),
          'price': PlutoCell(value: item.price),
        })
      ]);
      // cartRows.add(PlutoRow(
      //   cells: {
      //     'items': PlutoCell(value: item.name),
      //     'qty': PlutoCell(value: 1),
      //     'price': PlutoCell(value: item.price),
      //   }
      // ));
      update();
    } catch (e) {}
  }

  addProductToCartUsingKey(LogicalKeyboardKey key) {
    try {
      Items? item;
      if (key == (LogicalKeyboardKey.digit1)) {
        item = getMenu.items?[0];
      } else if (key == (LogicalKeyboardKey.digit2)) {
        item = getMenu.items?[1];
      } else if (key == (LogicalKeyboardKey.digit3)) {
        item = getMenu.items?[2];
      } else if (key == (LogicalKeyboardKey.digit4)) {
        item = getMenu.items?[3];
      } else if (key == (LogicalKeyboardKey.digit5)) {
        item = getMenu.items?[4];
      } else if (key == (LogicalKeyboardKey.digit6)) {
        item = getMenu.items?[5];
      } else if (key == (LogicalKeyboardKey.digit7)) {
        item = getMenu.items?[6];
      } else if (key == (LogicalKeyboardKey.digit8)) {
        item = getMenu.items?[7];
      } else if (key == (LogicalKeyboardKey.digit9)) {
        item = getMenu.items?[8];
      } else if (key == (LogicalKeyboardKey.digit0)) {
        item = getMenu.items?[9];
      }
      if (item == null) return;
      // check if product is already exists and update qty
      if (items.contains(item)) {
        for (int i = 0; i < items.length; i++) {
          if (item.name == items[i].name) {
            items[i].qty = (items[i].qty ?? 0) + 1;

            stateManager.changeCellValue(
                stateManager.rows[i].cells['qty']!, items[i].qty,
                force: true);
            return;
          }
        }
      }
      items.add(item);

      stateManager.appendRows([
        PlutoRow(cells: {
          'items': PlutoCell(value: item.name),
          'qty': PlutoCell(value: 1),
          'price': PlutoCell(value: item.price),
        })
      ]);
      // cartRows.add(PlutoRow(
      //   cells: {
      //     'items': PlutoCell(value: item.name),
      //     'qty': PlutoCell(value: 1),
      //     'price': PlutoCell(value: item.price),
      //   }
      // ));
      update();
    } catch (e) {}
  }
}
