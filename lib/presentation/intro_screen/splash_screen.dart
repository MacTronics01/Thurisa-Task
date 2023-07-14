import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thurisa_labs_task/routes/routes.dart';
import 'package:thurisa_labs_task/utils/app_images.dart';
import 'package:thurisa_labs_task/utils/app_strings.dart';
import 'package:thurisa_labs_task/utils/constants.dart';
import 'package:thurisa_labs_task/utils/pallet.dart';
import 'package:thurisa_labs_task/utils/widget_extensions.dart';
import '../../utils/button.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Pallet.primary,
        body: Container(
          width: width(context),
          height: height(context),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppImages.background),
              fit: BoxFit.fill,
            ),
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: 36, right: 30.w, left: 30.w),
              child: AppButton(
                buttonBgColor: Pallet.white,
                buttonTextColor: Pallet.primary,
                onPressed: () {
                  navigationService.navigateToReplace(AppRoutes.home);
                },
                title: AppStrings.get_started,
              ),
            ),
          ),
        ));
  }
}
