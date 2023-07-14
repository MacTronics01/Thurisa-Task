import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thurisa_labs_task/presentation/home/product_details.dart';
import 'package:thurisa_labs_task/utils/app_images.dart';
import 'package:thurisa_labs_task/utils/app_strings.dart';
import 'package:thurisa_labs_task/utils/constants.dart';
import 'package:thurisa_labs_task/utils/snack_message.dart';
import 'package:thurisa_labs_task/utils/style_manager.dart';
import 'package:thurisa_labs_task/utils/widget_extensions.dart';
import '../../domain/models/product_model.dart';
import '../../utils/input.dart';
import '../../utils/pallet.dart';
import '../../utils/shimmer_loader.ui.dart';
import '../../widgets/card.dart';
import '../base/base_ui.dart';
import 'home_screen.vm.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      onModelReady: (model) async {
        model.getCategories();
      },
      builder: (context, model, child) => Scaffold(
        backgroundColor: Pallet.grey.withOpacity(0.1),
        body: DefaultTabController(
          length: model.categories?.length ?? 0,
          initialIndex: 0,
          child: SizedBox(
            width: width(context),
            height: height(context),
            child: Column(
              children: [
                74.0.sbH,
                Container(
                  margin: EdgeInsets.only(left: 24.w, right: 24.w),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          showCustomToast("No Screen Available", success: false);
                        },
                        child: Image.asset(
                          AppImages.menus,
                          height: 14.7,
                          width: 22,
                          color: Pallet.black,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          showCustomToast("No Screen Available", success: false);
                        },
                        child: Image.asset(
                          AppImages.shop,
                          height: 24,
                          width: 24,
                          color: Pallet.black,
                        ),
                      ),
                    ],
                  ),
                ),
                40.0.sbH,
                Container(
                  margin: EdgeInsets.only(left: 24.w),
                  alignment: Alignment.topLeft,
                  child: Text(
                    AppStrings.delicious,
                    style: getBoldStyle(fontSize: 34),
                  ),
                ),
                24.0.sbH,
                Container(
                  margin: EdgeInsets.only(left: 24.w, right: 24),
                  child: const InputField(
                    prefixIcon: Icon(
                      Icons.search,
                      color: Pallet.black,
                      size: 24,
                    ),
                    hintText: "Search",
                    showCursor: true,
                    border: InputBorder.none,
                  ),
                ),
                24.0.sbH,
                Expanded(
                  child: Column(
                    children: [
                      24.0.sbH,
                      Container(
                        margin:
                        EdgeInsets.only(bottom: 30.h, left: 24.w),
                        height: 34.h,
                        child: TabBar(
                          splashFactory: NoSplash.splashFactory,
                          indicatorWeight: 5,
                          indicatorPadding: EdgeInsets.only(top: 32),
                          isScrollable: true,
                          indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.r),
                            color: Pallet.primary,
                          ),
                          labelColor: Pallet.primary,
                          unselectedLabelColor: Pallet.grey,
                          tabs: List<Widget>.generate(
                            model.categories?.length ?? 0,
                                (index) {
                              return Tab(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10.h),
                                  child: Text(
                                    "${model.categories?[index].name}",
                                    style: getLightStyle(fontSize: 17),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          children: List<Widget>.generate(
                            model.categories?.length ?? 0,
                                (index) {
                              return Scaffold(
                                backgroundColor: Pallet.white5,
                                body: Column(
                                  children: [
                                    const Text(
                                      'see more',
                                      style: TextStyle(
                                        color: Pallet.primary,
                                        fontSize: 15,
                                        fontFamily: 'SF Pro Rounded',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    20.0.sbH,
                                    Expanded(
                                      child: FutureBuilder<List<GetProductResponse>?>(
                                        future: model.getProducts(model.categories?[index].id ?? 0),
                                        builder: (context, snapshot) {
                                          if (snapshot.hasData) {
                                            List<GetProductResponse>? product = snapshot.data;
                                            if (product?.isEmpty ?? true) {
                                              return Center(child: Text("No product available"));
                                            } else {
                                              return ListView.builder(
                                                scrollDirection: Axis.horizontal,
                                                itemCount: product?.length,
                                                itemBuilder: (_, index) {
                                                  return CardWidget(
                                                    title: product?[index].title,
                                                    price: "#${product?[index].price.toString()}",
                                                    image: product?[index].images?[0],
                                                    onTap: () {
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(builder: (context) =>
                                                            ProductDetailsScreen(
                                                              id: product?[index].id,
                                                            )),
                                                      );
                                                    },
                                                  );
                                                },
                                              );
                                            }
                                          } else if (snapshot.hasError) {
                                            return Center(child: Text("Error loading products"));
                                          } else {
                                            return const ShimmerCart();
                                          }
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
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
}
