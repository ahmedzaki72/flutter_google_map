import 'dart:convert';

import 'package:flutter_map_app/modals/office_modal.dart';
import 'package:flutter_map_app/modals/offices_modal.dart';
import 'package:http/http.dart' as http;


class Apis {

  Future<List<Office>> fetchingOffice() async {

     final response = await http.get("https://about.google/static/data/locations.json");
     print(response.statusCode);
     if(response.statusCode == 200){
       var  data =  jsonDecode(response.body);
       OfficesList offices = OfficesList.fromJson(data);
       List<Office> officesList =
       offices.offices.map((e) => Office.fromJson(e)).toList();
       return officesList;
     }else{
       throw Exception('failed to load office');
     }
  }
}