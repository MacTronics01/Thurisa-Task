import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thurisa_labs_task/utils/pallet.dart';

class NavigationBarItem extends StatelessWidget {
  NavigationBarItem({
    Key? key,
    required this.icon,
    required this.index,
    this.isSelected = false,
    required this.onTap,
  }) : super(key: key);

  final String icon;
  final int index;
  final bool isSelected;
  ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          onTap(index);
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          padding: EdgeInsets.only(
            left: 2.w,
            right: 2.w,
          ),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100.r),
              color: isSelected
                  ? Pallet.primary1.withOpacity(0.1)
                  : Colors.transparent),
          // height: 30.h,
          child: Image.asset(
            icon,
            height: 22.6.h,
            width: isSelected ? 40.6.w : 30.6.w,
            color: isSelected ? Pallet.primary : Pallet.grey1,
          ),
        ),
      ),
    );
  }
}
