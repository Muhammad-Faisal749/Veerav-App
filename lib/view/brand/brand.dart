import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import 'package:swooshed_app/utils/app_styles/app_text_styles.dart';
import 'package:swooshed_app/widgets/custom_sized_box/custom_sized_box.dart';
import 'package:swooshed_app/widgets/custom_text_form_field/custom_text_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../controller/brand_provider/brand_provider.dart';
import '../../utils/app_colors/app_colors.dart';
import '../../utils/app_constants/app_constant.dart';
import '../../widgets/custom_app_bar/custom_app_bar.dart';
import '../../widgets/custom_button/custom_buttons.dart';
import '../../widgets/custom_text/custom_text.dart';
import '../details/details.dart';
import 'components/choose_brand_data.dart';

class Brand extends StatefulWidget {
  const Brand({super.key});

  @override
  State<Brand> createState() => _BrandState();
}

class _BrandState extends State<Brand> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<ChooseBrandProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _searchController = TextEditingController();
    return Scaffold(

        ///App Bar
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 50.h,
          backgroundColor: AppColors.bgColor,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///App Bar Skip Text
              GestureDetector(
                onTap: () {
                  Get.to(Details());
                },
                child: CustomAppBar(
                  leadingIcon: Icons.arrow_back_ios_new,
                  leadingText: AppLocalizations.of(context)!.step_2,
                  trailText: AppLocalizations.of(context)!.skip,
                ),
              ),

              ///Choose Category Screen
              Padding(
                padding: EdgeInsets.only(left: 22.w),
                child: CustomText(
                  text: AppLocalizations.of(context)!.choose,
                  style: AppTextStyles.heading1,
                ),
              ),
            ],
          ),
        ),
        backgroundColor: AppColors.bgColor,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
          child: Column(
            children: [
              SizedBox(height: 20.h),

              ///Text Form Field
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 21.w),
                child: TextForm(
                  controller: _searchController,
                  // onChanged: ,
                  hintText: AppLocalizations.of(context)!.search,
                  prefixIcon: Icon(
                    Icons.search,
                    color: AppColors.bgColor,
                    size: 20,
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: CustomSizedBox(height: 320.h, child: ChooseBrandData()),
              )
            ],
          ),
        ),
        bottomNavigationBar: Consumer<ChooseBrandProvider>(
          builder: (context, value, child) {
            return Container(
              height: 50.h,
              margin: EdgeInsets.only(left: 30.r, right: 30.r, bottom: 50.h),
              child: CustomButton(
                text: AppLocalizations.of(context)!.next,
                onPressed: () {
                  if (value.currentIndex == -1) {
                    print("********************TOAST SUCCESS***************");
                    AppTexts.flutterToast(
                        message: "Please Select Brand Category", error: true);
                  } else {
                    print("********************TOAST FAILED***************");

                    AppTexts.flutterToast(message: "Success", error: true);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Details(),
                      ),
                    );
                  }
                },
              ),
            );
          },
        ));
  }
}
