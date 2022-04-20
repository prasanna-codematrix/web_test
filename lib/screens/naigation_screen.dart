import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:web_test/routes/routes.dart';
import 'package:web_test/screens/dash_screen.dart';
import 'package:web_test/screens/weebls_screen.dart';
import 'package:web_test/widgets/menu_widget.dart';

class NavigationScreen extends StatefulWidget {
  late Widget child;

  NavigationScreen({required this.child});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  PageController page = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        MenuWidget(),
        Expanded(
          child: Navigator(
            key: navigatorKey,
            onGenerateRoute: RouteGenerator.generateRoute,
            initialRoute: RoutesName.DASH_SCREEN,
            // child: Container(
            //     padding: EdgeInsets.zero,
            //     color: Colors.grey.withOpacity(.01),
            //     child: widget.child
            //  ),
          ),
        ),
      ],
    ));
  }
}
