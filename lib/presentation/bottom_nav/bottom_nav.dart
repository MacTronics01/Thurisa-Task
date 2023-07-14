import 'package:flutter/material.dart';
import '../../utils/pallet.dart';
import '../base/base_ui.dart';
import 'bottom_bar.dart';
import 'bottom_nav.vm.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key,});
  @override
  _BottomNavState createState() => _BottomNavState();
}

final ValueNotifier<int> pageIndex = ValueNotifier(0);

class _BottomNavState extends State<BottomNav> {


  @override
  void initState() {
    pageIndex.value = 0;
    super.initState();
  }

  void _onNavigationItem(index) {
    pageIndex.value = index;
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<BottomNavViewModel>(
      onModelReady: (model) async {},
      builder: (context, model,child) => WillPopScope(
        onWillPop: () async {
          model.closeApp(context);
          return false;
        },
        child: Scaffold(
          backgroundColor: Pallet.white,
          body: ValueListenableBuilder(
              valueListenable: pageIndex,
              builder: (BuildContext context, int value, _) {
                return model.children[value];
              }),
          bottomNavigationBar: BottomNavBar(
            onItemSelected: _onNavigationItem,
          ),
        ),
      ),
    );
  }


}
