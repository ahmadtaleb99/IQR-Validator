import 'package:get/get.dart';
import 'package:iqr_validator/controller/AuthController.dart';

class AuthBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(AuthController());
  }

}