import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:swooshed_app/controller/all_categories_provider/all_categories_provider.dart';
import 'package:swooshed_app/utils/app_colors/app_colors.dart';
import 'package:swooshed_app/utils/app_styles/app_text_styles.dart';
import 'package:swooshed_app/widgets/custom_sized_box/custom_sized_box.dart';
import '../../model/home_categories_model/categories_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../widgets/custom_text/custom_text.dart';
import 'catergories_components/categories_components.dart';
import 'check_results_components/check_results_components.dart';

import 'homePageView/homePageView.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController SearchController = TextEditingController();

  // HomeModel activeSearchBar = HomeModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<AllCategoriesProvider>(context, listen: false)
        .getAllCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            await Provider.of<AllCategoriesProvider>(context, listen: false)
                .getAllCategories();

            // return true;
          },
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // activeSearchBar.categoriesData.isEmpty ? Text("Empty"):
                HomePageViewComponent(),

                CustomSizedBox(
                  height: 32.h,
                ),

                ///Categories Text
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.r),
                  child: CustomText(
                    text: AppLocalizations.of(context)!.categories,
                    style: AppTextStyles.fontSize14to700
                        .copyWith(color: AppColors.textColor),
                  ),
                ),

                CustomSizedBox(
                  height: 13.h,
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.r),
                  child: CategoriesComponents(),
                ),

                CustomSizedBox(
                  height: 32.h,
                ),

                ///check Results Text
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.r),
                  child: CustomText(
                    text: AppLocalizations.of(context)!.check_result,
                    style: AppTextStyles.fontSize14to700
                        .copyWith(color: AppColors.textColor),
                  ),
                ),

                CustomSizedBox(
                  height: 32.h,
                ),
                //
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 32.r),
                //   child: const CheckResultsComponents(),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
