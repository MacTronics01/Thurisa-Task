import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thurisa_labs_task/utils/widget_extensions.dart';
import '../../utils/app_strings.dart';
import '../../utils/font_manager.dart';
import '../../utils/pallet.dart';
import '../../utils/style_manager.dart';
import '../base/base.vm.dart';
import '../home/home_screen.dart';

class BottomNavViewModel extends BaseViewModel {
//List of screens on the bottom navigation
  final List children = [
    const HomeScreen(),
    Scaffold(
      body: Center(
        child: Text(
          "No Screen",
          style: getBoldStyle(color: Pallet.black),
        ),
      ),
    ),
    Scaffold(
      body: Center(
        child: Text(
          "No Screen",
          style: getBoldStyle(color: Pallet.black),
        ),
      ),
    ),
    Scaffold(
      body: Center(
        child: Text(
          "No Screen",
          style: getBoldStyle(color: Pallet.black),
        ),
      ),
    ),
  ];

// Close function before the app closes
  void closeApp(BuildContext context) {
    bool _isShown = true;
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
              actionsPadding: const EdgeInsets.all(0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.r)),
              title: Text(
                AppStrings.closeApp,
                style: getSemiBoldStyle(
                  fontSize: FontSize.s18,
                ),
                textAlign: TextAlign.center,
              ),
              content: SizedBox(
                  height: 130.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        AppStrings.closeAppDetails,
                        style: getRegularStyle(
                          fontSize: FontSize.s14,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      1.0.sbH,
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(vertical: 20.h),
                                  backgroundColor: Pallet.black,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(30.r))),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'No',
                                    style: getBoldStyle(
                                      color: Pallet.white,
                                      fontSize: FontSize.s16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          10.0.sbW,
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(vertical: 20.h),
                                  backgroundColor: Pallet.red,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(30.r))),
                              onPressed: () {
                                _isShown = false;
                                // Close the dialog
                                pop();
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Yes',
                                    style: getBoldStyle(
                                      color: Pallet.white,
                                      fontSize: FontSize.s16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )));
        });
  }

  //Pops the app back
  static Future<void> pop({bool? animated}) async {
    await SystemChannels.platform
        .invokeMethod<void>('SystemNavigator.pop', animated);
  }
}
