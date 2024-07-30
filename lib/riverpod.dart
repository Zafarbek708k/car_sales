import 'package:car_sales/src/feature/auth/controller/auth_vm_controller.dart';
import 'package:car_sales/src/feature/home/controller/home_vm_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authVMController = ChangeNotifierProvider((ref) {return AuthVmController();});
final homeVMController = ChangeNotifierProvider((ref) {return HomeVmController();});



