import 'package:get/get.dart';
import 'package:iqr_validator/controller/AboutController.dart';

class AboutBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(AboutController());
  }

}