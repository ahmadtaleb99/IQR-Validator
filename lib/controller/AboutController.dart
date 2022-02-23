import 'package:get/get.dart';
import 'package:iqr_validator/services/networking.dart';
import 'package:iqr_validator/utils/constants.dart';

class AboutController extends GetxController{

  String aboutInfo = '';
  @override
  void onInit()  {
    super.onInit();
    _getAboutInfo();
  }
  void _getAboutInfo() async {
    try{

      var data =   await NetworkingHelper.getData('$baseUrl/get-about-application');
      print(data.toString()+'******* data from api');
      if (data['status'] == true){
        aboutInfo = data['data'];
        update();

      }
      else
        throw 'null';
    }
    catch (e){
      print(e);
      rethrow;
    }

  }

}