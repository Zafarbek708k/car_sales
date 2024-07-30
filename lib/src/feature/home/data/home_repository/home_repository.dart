import 'dart:developer';

import 'package:car_sales/src/core/api/api.dart';
import 'package:car_sales/src/core/api/api_constants.dart';
import 'package:flutter/cupertino.dart';

import '../entity/home_car_model.dart';

class HomeRepository {
  List<CarModel> list = [];
  Future<List<CarModel>> fetchData({required String model, required BuildContext context}) async {
    String? result = await Api.getData(ApiConstants.carModel, ApiConstants.defaultParam(model: model), context);
    log("result String ==> ${result ?? "result = null"}");
    if (result != null) {
      try {
        list = carModelFromJson(result);
        return list;
      } catch (e) {
        log("Error parsing JSON: $e");
        return [];
      }
    } else {
      log("bo'sh list ketti");
      return [];
    }
  }
}

// class HomeRepository{
//   List<CarModel> list = [];
//   Future<List<CarModel>> fetchData({required String model, required BuildContext context})async{
//     String? result = await Api.getData(ApiConstants.carModel, ApiConstants.defaultParam(model: model), context);
//     log("result String ==> $result"??"result = null");
//     if(result != null){
//       list = carModelFromJson(result);
//       return list;
//     }else{
//       log("bo'sh list ketti");
//       return [];
//     }
//   }
// }

