import 'package:flutter/material.dart';

import '../presentation/bottom_nav/bottom_nav.dart';
import '../presentation/home/product_details.dart';


class AppRoutes {
  static const home = '/home';
  static const signIn = '/signIn';
  static const signUp = '/signUp';
  static const product = '/product';
}

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // E.g Navigator.of(context).pushNamed(AppRoutes.theScreenYouAreGoingTo);
    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const BottomNav(),
          settings: settings,
        );
        case AppRoutes.product:
        return MaterialPageRoute<dynamic>(
          builder: (_) =>  ProductDetailsScreen(),
          settings: settings,
        );

      default:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const Scaffold(),
          settings: settings,
        );
    }
  }
}
