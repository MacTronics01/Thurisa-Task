import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thurisa_labs_task/utils/app_images.dart';
import 'package:thurisa_labs_task/utils/app_strings.dart';
import 'package:thurisa_labs_task/utils/constants.dart';
import 'package:thurisa_labs_task/utils/snack_message.dart';
import 'package:thurisa_labs_task/utils/widget_extensions.dart';
import '../../utils/button.dart';
import '../../utils/pallet.dart';
import '../base/base_ui.dart';
import 'home_screen.vm.dart';

class ProductDetailsScreen extends StatefulWidget {
   ProductDetailsScreen({Key? key,  this. id}) : super(key: key);
  int? id;
  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
        onModelReady: (model) async {
          model.getSingleProducts(widget.id ?? 0);
        },
        builder: (context, model, child) =>
        model.isLoading? const CircularProgressIndicator():
            Scaffold(
              body: SizedBox(
                width: width(context),
                height: height(context),
                child:
                Column(
                  children: [
                    60.0.sbH,
                    Container(
                      margin: EdgeInsets.only(left: 24.w, right: 24.w),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                              onTap: () {
                                navigationService.goBack();
                              },
                              child: const Icon(
                                Icons.arrow_back_ios,
                                size: 22,
                                color: Pallet.black,
                              )),
                          GestureDetector(
                              onTap: () {
                                showCustomToast("No Screen Available",
                                    success: false);
                              },
                              child: Image.asset(
                                AppImages.love1,
                                height: 24,
                                width: 24,
                                color: Pallet.black,
                              )),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView(
                        padding: const EdgeInsets.all(0),
                        children: [
                          15.0.sbH,
                          SizedBox(
                            height: 256.h,
                            width: width(context),
                            child: PageView.builder(
                              itemCount: model.productResponse?.images?.length,
                              controller: PageController(viewportFraction: 1),
                              onPageChanged: (int index) =>
                                  setState(() => model.index = index),
                              itemBuilder: (_, i) {
                                var image =model.productResponse?.images?[i];
                                return Image.network(
                                  image!,
                                  fit: BoxFit.fill,
                                );
                              },
                            ),
                          ),
                          10.0.sbH,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: map<Widget>(
                              model.productResponse?.images ?? null as List<dynamic> ?? [], // Provide an empty list as a fallback
                                  (index, url) {
                                return Container(
                                  width: 8.w,
                                  height: 8.h,
                                  margin: EdgeInsets.symmetric(vertical: 10.0.w, horizontal: 5.0.h),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: model.index == index ? Pallet.primary : Pallet.grey,
                                  ),
                                );
                              },
                            ),
                          ),
                          24.0.sbH,
                           SizedBox(
                            width: 318,
                            height: 52,
                            child: Text(
                             "${model.productResponse?.title}",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 28,
                                fontFamily: 'SF Pro Rounded',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                           SizedBox(
                            width: 172,
                            height: 40,
                            child: Text(
                              "#${model.productResponse?.price}",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Pallet.primary,
                                fontSize: 22,
                                fontFamily: 'SF Pro Rounded',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          24.0.sbH,
                          Container(
                            margin: EdgeInsets.only(
                              left: 24.w,
                            ),
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              'Delivery info',
                              style: TextStyle(
                                color: Pallet.black,
                                fontSize: 17,
                                fontFamily: 'SF Pro Rounded',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          10.0.sbH,
                          Container(
                            margin: EdgeInsets.only(left: 24.w, right: 24.w),
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              textAlign: TextAlign.start,
                              'Delivered between monday aug and thursday 20 from 8pm to 91:32 pm',
                              style: TextStyle(
                                color: Pallet.grey,
                                fontSize: 15,
                                fontFamily: 'SF Pro Text',
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.30,
                              ),
                            ),
                          ),
                          24.0.sbH,
                          Container(
                            margin: EdgeInsets.only(
                              left: 24.w,
                            ),
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              'Return policy',
                              style: TextStyle(
                                color: Pallet.black,
                                fontSize: 17,
                                fontFamily: 'SF Pro Rounded',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          10.0.sbH,
                          Container(
                            margin: EdgeInsets.only(left: 24.w, right: 24.w),
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              textAlign: TextAlign.start,
                              'All our foods are double checked before leaving our stores so by any case you found a broken food please contact our hotline immediately.',
                              style: TextStyle(
                                color: Pallet.grey,
                                fontSize: 15,
                                fontFamily: 'SF Pro Text',
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.30,
                              ),
                            ),
                          ),
                          40.0.sbH,
                          Container(
                            margin: EdgeInsets.only(bottom: 36, right: 30.w, left: 30.w),
                            child: AppButton(
                              buttonBgColor: Pallet.primary,
                              buttonTextColor: Pallet.white,
                              onPressed: () {
                              showCustomToast("No API available",success: false);
                              },
                              title: AppStrings.add,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),));
  }
}
