import 'package:admin/models/order_type_button/delivery_button_model.dart';
import 'package:admin/models/order_type_button/dinein_button_model.dart';
import 'package:admin/models/order_type_button/pickup_button_model.dart';
import 'package:admin/models/order_type_model.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  static final OrderController instance = Get.put(OrderController());
  List<OrderTypeModel> orderTypeModels = [
    DineInOrderTypeModel(),
    DeliveryOrderTypeModel(),
    PickUpOrderTypeModel()
  ];
  // OrderType _orderType = OrderType.Delivery;
  RxString paymentType = "Cash".obs;
  final paymentOptions = ["Cash", "Card", "Due", "Other", "Part"].obs;
  RxBool isPaid = false.obs;
  RxBool showPayment = false.obs;

  OrderTypeModel selectedOrderType = DineInOrderTypeModel();
  double expandedHeight = 0.0;
  set setOrderType(OrderType orderType) {
    selectedOrderType =
        orderTypeModels.firstWhere((element) => element.orderType == orderType);
    update();
  }

  OrderType get orderType => selectedOrderType.orderType;
}
