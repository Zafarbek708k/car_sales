import 'dart:developer';

import 'package:flutter/material.dart';
import '../data/entity/home_car_model.dart';
import '../data/home_repository/home_repository.dart';

class HomeVmController extends ChangeNotifier {
  HomeVmController() : super(){}

  BuildContext? context;
  TextEditingController searchController = TextEditingController();
  List<CarModel> carList = [];
  bool isLoading = false;

  Future<void> fetchData({required String model, required BuildContext context}) async {
    isLoading = false;
    notifyListeners();
    log("message");
    carList = await HomeRepository().fetchData(model: model, context: context);
    log("message2");
    log("Home VM Controller =>$carList");
    isLoading = true;
    notifyListeners();
  }

  void floatButton(){
    isLoading = !isLoading;
    notifyListeners();
  }
}


