
import 'package:flutter/material.dart';
import '../data/cache/sharedpreferences.dart';
import '../data/services/navigation_service.dart';
import '../data/services/storage-service.dart';
import '../locator.dart';



final SharedPreference sharedPreference = SharedPreference();
final StorageService storageService = getIt<StorageService>();
final NavigationService navigationService = getIt<NavigationService>();


class Sized24Container extends StatelessWidget {
  final Widget? child;
  final Decoration? decoration;

  const Sized24Container({super.key, this.child, this.decoration});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: decoration,
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      child: child,
    );
  }
}


class AppFontSizes {
  static double headingFontSize32 = 32.0;
  static double headingFontSize24 = 24.0;
  static double headingFontSize22 = 22.0;
  static double headingFontSize20 = 20.0;
  static double titleFontSize18 = 18.0;
  static double titleFontSize16 = 16.0;
  static double titleNormalSize14 = 14.0;
  static double textCaptionSize12 = 12.0;
  static double textCaptionSize10 = 10.0;
}


List<T> map<T>(List list, Function handler) {
  List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }
  return result;
}
