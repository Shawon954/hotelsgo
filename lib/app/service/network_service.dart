

import 'dart:convert';

import '../model/homescreen_model.dart';
import 'package:http/http.dart' as http;

Future <List<Hoteldata>> GetApiData()async{

  final URL = Uri.http ('https://www.hotelsgo.co/test/hotels');

  var response = await http.get(URL);
  if(response.statusCode == 200){

    var data = jsonDecode(response.body);

    return hoteldataFromJson(data);

      print(data);

  } else{
    throw Exception('Data Failed');
  }



}