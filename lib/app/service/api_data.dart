
import 'dart:convert';

import 'package:http/http.dart'as http;

import '../model/hotels_model.dart';


class ApiService{

  Future <List<HotelsGo>> getfatchdata()async{

    var baseUrl = "https://www.hotelsgo.co/test/hotels";

    var response = await http.get(Uri.parse(baseUrl));

    if(response.statusCode == 200){
      var data = jsonDecode(response.body);

      List<HotelsGo> itemList = [];

      print(data.toString());

      data.map(( item) {
        itemList.add(HotelsGo.fromJson(item));
      }).toList();
      return itemList;

    }
    throw "Error Api Data";
  }



}