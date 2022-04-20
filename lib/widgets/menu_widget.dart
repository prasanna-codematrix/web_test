import 'package:flutter/material.dart';
import 'package:web_test/models/menu_model.dart';
import 'package:web_test/routes/routes.dart';
import 'package:web_test/widgets/menu_item.dart';

class MenuWidget extends StatefulWidget {
  @override
  State<MenuWidget> createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  List<MenuModel> menuList = [];
  int menuIndex = 0;

  @override
  void initState() {
    super.initState();
    _addItemsToMenuList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 8,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey,
          blurRadius: 5,
        )
      ], color: Colors.white),
      child: Column(
        children: [
          ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: menuList.length,
              itemBuilder: (context, index) {
                return MenuItemWidget(
                  context: context,
                  selectedIndex: menuIndex,
                  onTapIndex: (index) {
                    menuIndex = index;
                    setState(() {});
                  },
                  menuModel: menuList[index],
                );
              }),
        ],
      ),
    );
  }

  void _addItemsToMenuList() {
    menuList.add(MenuModel(
        iconData: Icons.dashboard_sharp,
        Name: 'Dashboard',
        index: 0,
        routesName: RoutesName.DASH_SCREEN));
    menuList.add(MenuModel(
        iconData: Icons.question_mark_rounded,
        Name: 'Weebls',
        index: 1,
        routesName: RoutesName.WEEBLS_SCREEN));
    menuList.add(MenuModel(
        iconData: Icons.supervisor_account,
        Name: 'Users & Roles',
        index: 2,
        routesName: RoutesName.USERS_SCREEN));
    menuList.add(MenuModel(
        iconData: Icons.cases,
        Name: 'UGC',
        index: 3,
        routesName: RoutesName.UGC_SCREEN));
    menuList.add(MenuModel(
        iconData: Icons.play_circle_outline_rounded,
        Name: 'Assets',
        index: 4,
        routesName: RoutesName.ASSETS_SCREEN));
    menuList.add(MenuModel(
        iconData: Icons.settings_rounded,
        Name: 'Config',
        index: 5,
        routesName: RoutesName.CONFIG_SCREEN));
  }
}
