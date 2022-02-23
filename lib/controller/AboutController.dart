import 'package:get/get.dart';
import 'package:iqr_validator/services/networking.dart';
import 'package:iqr_validator/utils/constants.dart';

class AboutController extends GetxController{

  String aboutInfo = '';
  bool isLoading = false ;
  @override
  void onInit()  {
    super.onInit();
    _getAboutInfo();
  }
  void _getAboutInfo() async {
    try{
      isLoading = true ;

      var data =   await NetworkingHelper.getData('$baseUrl/get-about-application');
      if (data['status'] == true){
        aboutInfo = data['data'];
      }
      // else
    }
    catch (e){
      print(e);
    }
    finally {
      isLoading = false;
      update();
    }

  }

}