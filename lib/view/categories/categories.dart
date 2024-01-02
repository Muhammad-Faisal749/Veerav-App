import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:swooshed_app/utils/app_styles/app_text_styles.dart';
import 'package:swooshed_app/utils/app_urls/app_urls.dart';
import '../../controller/all_categories_provider/all_categories_provider.dart';
import '../../model/category_model/category_model.dart';
import '../../utils/app_colors/app_colors.dart';
import '../../utils/app_images/app_images.dart';
import '../../widgets/custom_app_bar/custom_app_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../widgets/custom_button/custom_buttons.dart';
import '../../widgets/custom_container/custom_container.dart';
import '../../widgets/custom_image/custom_image.dart';
import '../../widgets/custom_text/custom_text.dart';
import '../brand/brand.dart';

// ignore: must_be_immutable
class Categories extends StatefulWidget {
  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<CategoryData> _categorys(BuildContext context) {
    return [
      CategoryData(
          iconUrl: AppImages.category1,
          titleText: AppLocalizations.of(context)!.electronic),
      CategoryData(
          iconUrl: AppImages.category2,
          titleText: AppLocalizations.of(context)!.fashion),
      CategoryData(
          iconUrl: AppImages.category3,
          titleText: AppLocalizations.of(context)!.collectible),
      CategoryData(
          iconUrl: AppImages.category4,
          titleText: AppLocalizations.of(context)!.health),
      CategoryData(
          iconUrl: AppImages.category5,
          titleText: AppLocalizations.of(context)!.book),
      CategoryData(
          iconUrl: AppImages.category6,
          titleText: AppLocalizations.of(context)!.other),
    ];
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<AllCategoriesProvider>(context, listen: false)
        .getAllCategories();
  }

  @override
  Widget build(BuildContext context) {
    final _category = _categorys(context);
    return Scaffold(
      ///App Bar
      appBar: AppBar(
        toolbarHeight: 80.h,
        leadingWidth: double.infinity,
        leading: Padding(
          padding: EdgeInsets.only(left: 16.w, top: 10.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(
                leadingIcon: Icons.arrow_back_ios_new,
                leadingText: AppLocalizations.of(context)!.step,
                trailText: '',
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 25.w,
                ),
                child: CustomText(
                  text: AppLocalizations.of(context)!.choose,
                  style: AppTextStyles.heading1,
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: AppColors.bgColor,
      body: Consumer<AllCategoriesProvider>(
        builder: (context, getChooseCategory, child) {
          var chooseData = getChooseCategory.myCategoriesList[0];
          return SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10.w,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///Categories List
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    // padding: EdgeInsets.zero,
                    child: SizedBox(
                        height: 470.h,
                        child: getChooseCategory.myCategoriesList.length != 0
                        ? getChooseCategory.myCategoriesList[0].categories!.length != 0 ?
                        ListView.builder(
                                physics: BouncingScrollPhysics(),
                                itemCount: getChooseCategory
                                    .myCategoriesList[0].categories!.length,
                                // shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return CustomContainer(
                                    margin: EdgeInsets.only(bottom: 6.h),
                                    padding:
                                        EdgeInsets.symmetric(vertical: 10.h),
                                    // height: 70.h,
                                    width: MediaQuery.of(context).size.width,
                                    borderRadius: BorderRadius.circular(10.r),
                                    // gradient: AppColors.mediumGradient,
                                    child: Align(
                                      child: ListTile(
                                        // contentPadding: EdgeInsets.symmetric(
                                        //     horizontal: 12.w, vertical: 10.h),
                                        leading: Padding(
                                          padding: EdgeInsets.all(2.r),
                                          child: Container(
                                            // height: 50.w,
                                            width: 50.h,
                                            padding: EdgeInsets.symmetric(
                                                vertical: 10.h),
                                            decoration: BoxDecoration(
                                              color: AppColors.textColor,
                                              borderRadius:
                                                  BorderRadius.circular(10.r),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: AppColors.bgColor
                                                      .withOpacity(0.2),
                                                  spreadRadius: 2,
                                                  blurRadius: 5,
                                                  offset: Offset(0, 3),
                                                ),
                                              ],
                                            ),
                                            child: Center(
                                              child: Image.network(
                                                AppUrls.imageUrl +
                                                    chooseData
                                                        .categories![index]
                                                        .image
                                                        .toString(),
                                                color: Colors.black,
                                                width: 30,
                                                height: 30,
                                              ),
                                            ),
                                          ),
                                        ),
                                        title: CustomText(
                                          textAlign: TextAlign.start,
                                          text: chooseData
                                              .categories![index].name
                                              .toString(),
                                          style: AppTextStyles.fontSize18to700
                                              .copyWith(
                                                  fontSize: 17,
                                                  color: AppColors.bgColor),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ) : Center(child: Text("No Data Found",style: TextStyle(color: Colors.white),),)
                            : CircularProgressIndicator())
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 34.h),
        child: Container(
          height: 50.h,
          margin: EdgeInsets.only(bottom: 30.w),
          child: CustomButton(
            text: AppLocalizations.of(context)!.next,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Brand(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
