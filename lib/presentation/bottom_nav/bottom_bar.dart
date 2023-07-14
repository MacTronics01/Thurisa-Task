import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/app_images.dart';
import '../../utils/pallet.dart';
import 'bar_items.dart';

/* The Custom Navigation Bars */

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({
    Key? key,
    required this.onItemSelected,
  }) : super(key: key);

  //handles the state changes
  final ValueChanged<int> onItemSelected;

  @override
  State<BottomNavBar> createState() => BottomNavBarState();
}

class BottomNavBarState extends State<BottomNavBar> {
  //selected index of the screens
  var selectedIndex = 0;

  //handles selections between the screens
  void handleItemSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
    widget.onItemSelected(index);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 20.h),
      padding: EdgeInsets.only(top: 2.h, bottom: 2.h),
      color: Pallet.white,
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            NavigationBarItem(
              icon: selectedIndex == 0 ? AppImages.home2 : AppImages.home1,
              isSelected: (selectedIndex == 0),
              index: 0,
              onTap: handleItemSelected,
            ),
            NavigationBarItem(
              icon: selectedIndex == 1 ? AppImages.love2 : AppImages.love1,
              isSelected: (selectedIndex == 1),
              index: 1,
              onTap: handleItemSelected,
            ),
            NavigationBarItem(
              icon: selectedIndex == 2 ? AppImages.person2 : AppImages.person1,
              isSelected: (selectedIndex == 2),
              index: 2,
              onTap: handleItemSelected,
            ),
            NavigationBarItem(
              icon: selectedIndex == 3 ? AppImages.time2 : AppImages.time1,
              isSelected: (selectedIndex == 3),
              index: 3,
              onTap: handleItemSelected,
            ),
          ]),
    );
  }
}
