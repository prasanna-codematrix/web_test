import 'package:flutter/material.dart';
import 'package:web_test/screens/dash_screen.dart';
import 'package:web_test/screens/weebls_screen.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class RoutesName {
  static const String DASH_SCREEN = '/dash_screen';
  static const String WEEBLS_SCREEN = '/weebls_screen';
  static const String USERS_SCREEN = '/users_screen';
  static const String UGC_SCREEN = '/ugc_screen';
  static const String ASSETS_SCREEN = '/assets_screen';
  static const String CONFIG_SCREEN = '/config_screen';
  static const String NAVIGATION_SCREEN = '/navigation_screen';
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.DASH_SCREEN:
        return _GeneratePageRoute(
            widget: DashScreen(), routeName: settings.name!);
      case RoutesName.WEEBLS_SCREEN:
        return _GeneratePageRoute(
            widget: WeeblsScreen(), routeName: settings.name!);
      default:
        return _GeneratePageRoute(
            widget: DashScreen(), routeName: settings.name!);
    }
  }
}

class _GeneratePageRoute extends PageRouteBuilder {
  final Widget widget;
  final String routeName;

  _GeneratePageRoute({required this.widget, required this.routeName})
      : super(
          settings: RouteSettings(name: routeName),
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return widget;
          },
        );
}
