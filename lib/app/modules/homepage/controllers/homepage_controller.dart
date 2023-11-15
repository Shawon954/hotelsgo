import 'package:get/get.dart';
import 'package:hotelsgo/app/model/homescreen_model.dart';
import 'package:hotelsgo/app/service/network_service.dart';

class HomepageController extends GetxController {

  var isloading = false.obs;

 final hoteldata = <Hoteldata>[].obs;


  @override
  void onInit() {
    super.onInit();
    GetData();

  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void GetData()async{
    try{
      isloading(true);
       var readdate = await NetworkService().GetApiData();

       if(readdate !=null){
         hoteldata.assignAll(readdate);
       }
       print(hoteldata);
    }
  catch(e)
  {
      print(e.toString());
  }
  finally
  {
      isloading(false);
  }
}


}
