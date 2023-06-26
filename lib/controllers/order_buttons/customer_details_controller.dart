import 'package:get/get.dart';

class CustomerDetailsController extends GetxController {
  static CustomerDetailsController instance =
      Get.put(CustomerDetailsController());

  bool _isExpanded = false;

  bool get isExpanded => _isExpanded;
  
  set setIsExpaned(bool value) {
    _isExpanded = value;
    
  }
}
