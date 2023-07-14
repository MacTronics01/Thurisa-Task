import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:thurisa_labs_task/utils/pallet.dart';
import 'package:thurisa_labs_task/utils/widget_extensions.dart';
import 'app_images.dart';


Widget toast(String message, {bool? success}) {
  return Padding(
    padding: const EdgeInsets.all(20),
    child: Align(
      alignment: Alignment.bottomCenter,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4.0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          width: double.infinity,
          height: 60.0,
          color:
          !success! ? Pallet.red : Pallet.green,
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    !success? Image.asset(AppImages.warning,width: 25,
                        height: 25):
                    Image.asset(AppImages.check,width: 25,height: 25,),
                    10.0.sbW,
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            message.toUpperCase(),
                            style: TextStyle(
                              color: !success ?Pallet.white :
                              Pallet.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

showCustomToast(String message, {bool success = false, num? time}) {
  // dialogLocation(message: message, success: success, time: time);
  showToastWidget(
    toast(message, success: success),
    duration: const Duration(seconds: 3),
    onDismiss: () {},
  );
}