import 'package:flutter/material.dart';
import 'package:taskapp/screens/RecycleBin.dart';
import 'package:taskapp/screens/pendingtasks_screen.dart';

import '../screens/tabs_screen.dart';

class AppRouter {
  Route? onGeneraRoute(RouteSettings routesettings) {
    switch (routesettings.name) {
      case TabsScreen.id:
        return MaterialPageRoute(builder: (_) => TabsScreen());

      case RecycleBinScreen.id:
        return MaterialPageRoute(builder: (_) => const RecycleBinScreen());
      default:
        return null;
    }
  }
}
