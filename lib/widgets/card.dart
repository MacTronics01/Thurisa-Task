
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thurisa_labs_task/utils/widget_extensions.dart';

import '../utils/pallet.dart';

class CardWidget extends StatelessWidget {
  CardWidget({
    super.key,
    required this.title,
    required this.price,
    required this.image,
    required this.onTap
  });
  String? title;
  String? price;
  String? image;
  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(left: 15.5.w,right: 15.5.w),
        width: 220,
        height: 312,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 42,
              child: Container(
                width: 220,
                height: 270,
                decoration: ShapeDecoration(
                  color: Pallet.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x19393939),
                      blurRadius: 60,
                      offset: Offset(0, 30),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child:  Column(
                  children: [
                    140.0.sbH,
                    Expanded(
                      child: Text(
                        title!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Pallet.black,
                          fontSize: 22,
                          fontFamily: 'SF Pro Rounded',
                          fontWeight: FontWeight.w600,
                          // height: 22.29,
                        ),
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(bottom: 30.h),
                      child: Text(
                        price!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Pallet.primary,
                          fontSize: 17,
                          fontFamily: 'SF Pro Rounded',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 26,
              top: 0,
              child:
              Container(
                width: 168,
                height: 189,
                decoration: ShapeDecoration(
                  image:  DecorationImage(
                    image: NetworkImage(image!),
                    fit: BoxFit.fill,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}