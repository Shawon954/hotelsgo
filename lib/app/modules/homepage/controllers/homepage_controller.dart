import 'package:get/get.dart';
import 'package:hotelsgo/app/model/hotels_model.dart';
import 'package:hotelsgo/app/service/api_data.dart';



class HomepageController extends GetxController {


  var isLoading = true.obs;
  var hoteldatainfo = <HotelsGo>[].obs;

  var plantantigensselected = [].obs;
  @override
  void onInit() {

    collectiongetapidata();
    toogle(0);
    super.onInit();

  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }


   collectiongetapidata()async{

    try{
       isLoading(true).obs;
      var receivedata = await ApiService().getfatchdata();


       if(reactive !=null){
         hoteldatainfo.assignAll(receivedata);
       }





    }catch(e){
      print("Error fatching HostelsGo Data $e");
    }
    finally{
      isLoading(false);
    }



  }


  toogle(int index) {
    if (plantantigensselected.contains(index)) {
      plantantigensselected.remove(index);
    } else {
      plantantigensselected.add(index);
    }
  }


}