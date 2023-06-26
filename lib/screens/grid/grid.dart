import 'package:admin/controllers/cart_controller.dart';
import 'package:admin/screens/grid/grid_shortcuts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pluto_grid/pluto_grid.dart';

/// PlutoGrid Example
//
/// For more examples, go to the demo web link on the github below.
class PlutoGridExamplePage extends StatefulWidget {
  const PlutoGridExamplePage({Key? key}) : super(key: key);

  @override
  State<PlutoGridExamplePage> createState() => _PlutoGridExamplePageState();
}

class _PlutoGridExamplePageState extends State<PlutoGridExamplePage> {
  final List<PlutoColumn> columns = <PlutoColumn>[
    PlutoColumn(
      title: 'Items',
      field: 'items',
      type: PlutoColumnType.text(),
    ),
    PlutoColumn(
      title: 'QTY.',
      field: 'qty',
      type: PlutoColumnType.number(),
    ),
    PlutoColumn(
      title: 'Price',
      field: 'price',
      type: PlutoColumnType.currency(),
    ),

    // PlutoColumn(
    //   title: 'salary',
    //   field: 'salary',
    //   type: PlutoColumnType.currency(),
    //   footerRenderer: (rendererContext) {
    //     return PlutoAggregateColumnFooter(
    //       rendererContext: rendererContext,
    //       formatAsCurrency: true,
    //       type: PlutoAggregateColumnType.sum,
    //       format: '#,###',
    //       alignment: Alignment.center,
    //       titleSpanBuilder: (text) {
    //         return [
    //           const TextSpan(
    //             text: 'Sum',
    //             style: TextStyle(color: Colors.red),
    //           ),
    //           const TextSpan(text: ' : '),
    //           TextSpan(text: text),
    //         ];
    //       },
    //     );
    //   },
    // ),
  ];

  /// columnGroups that can group columns can be omitted.
  final List<PlutoColumnGroup> columnGroups = [
    PlutoColumnGroup(title: 'Id', fields: ['id'], expandedColumn: true),
    PlutoColumnGroup(title: 'User information', fields: ['name', 'age']),
    PlutoColumnGroup(title: 'Status', children: [
      PlutoColumnGroup(title: 'A', fields: ['role'], expandedColumn: true),
      PlutoColumnGroup(title: 'Etc.', fields: ['joined', 'working_time']),
    ]),
  ];

  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: PlutoGrid(
          columns: columns,
          mode: PlutoGridMode.readOnly,

          rows: cartController.cartRows,
          onSelected: (e) {
            cartController.incrementQtyOfItem();
          },
          onRowDoubleTap: (e) {
            cartController.incrementQtyOfItem();
          },
          // columnGroups: columnGroups,
          onLoaded: (PlutoGridOnLoadedEvent event) {
            cartController.stateManager = event.stateManager;
            cartController.stateManager.setShowColumnFilter(true);
          },
          onRowsMoved: (PlutoGridOnRowsMovedEvent event) {
            print("event is " + event.toString());
          },
          onChanged: (PlutoGridOnChangedEvent event) {
            print(event);
          },
          configuration: PlutoGridConfiguration(
            enableMoveHorizontalInEditing: false,
            shortcut: PlutoGridShortcut(
              actions: {
                ...PlutoGridShortcut.defaultActions,
                LogicalKeySet(LogicalKeyboardKey.keyI): GridKeyIPressed(),
                LogicalKeySet(LogicalKeyboardKey.keyD): GridKeyDPressed(),
                LogicalKeySet(LogicalKeyboardKey.delete): GridKeyDelPressed(),
                LogicalKeySet(LogicalKeyboardKey.f2): GridKeyf2Pressed(),
              },
            ),
          ),
        ),
      ),
    );
  }
}
