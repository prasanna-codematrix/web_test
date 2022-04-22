import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:web_test/models/menu_model.dart';
import 'package:web_test/routes/routes.dart';

class MenuItemWidget extends StatefulWidget {
  BuildContext context;
  late MenuModel menuModel;
  int selectedIndex = 0;
  ValueChanged<int> onTapIndex;

  MenuItemWidget({
    required this.menuModel,
    required this.context,
    required this.onTapIndex,
    required this.selectedIndex,
  });

  @override
  State<MenuItemWidget> createState() => _MenuItemWidgetState();
}

class _MenuItemWidgetState extends State<MenuItemWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTapIndex(widget.menuModel.index);
        navigatorKey.currentState?.pushNamed(widget.menuModel.routesName);
      },
      child: ResponsiveBuilder(
        builder: (context, builder) {
          print(builder.screenSize.width);
          return Container(
            margin: EdgeInsets.all(1),
            padding: EdgeInsets.all(builder.screenSize.width/100.8),
            color: Colors.white,
            width: MediaQuery.of(context).size.width / 8,
            child: Row(
              children: [
                Icon(widget.menuModel.iconData,
                    color: widget.menuModel.index == widget.selectedIndex
                        ? Colors.red
                        : Colors.black,size: (builder.screenSize.width / 80) ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  widget.menuModel.Name,
                  style: TextStyle(
                      color: widget.menuModel.index == widget.selectedIndex
                          ? Colors.red
                          : Colors.black,
                      fontSize: (builder.screenSize.width / 100) * 1.25),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
