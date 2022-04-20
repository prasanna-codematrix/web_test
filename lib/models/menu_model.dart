import 'package:flutter/cupertino.dart';
import 'package:web_test/routes/routes.dart';

class MenuModel {
  late String Name;
  late IconData iconData;
  late String routesName;
  int index;

  MenuModel(
      {required this.iconData,
      this.index = 0,
      required this.Name,
      required this.routesName});
}
