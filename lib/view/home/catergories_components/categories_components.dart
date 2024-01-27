import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:swooshed_app/utils/app_colors/app_colors.dart';
import 'package:swooshed_app/utils/app_styles/app_text_styles.dart';
import 'package:swooshed_app/utils/app_urls/app_urls.dart';
import 'package:swooshed_app/widgets/custom_text/custom_text.dart';

import '../../../controller/all_categories_provider/all_categories_provider.dart';
import '../../../model/home_categories_model/categories_model.dart';

class CategoriesComponents extends StatefulWidget {
  CategoriesComponents({super.key});

  @override
  State<CategoriesComponents> createState() => _CategoriesComponentsState();
}

class _CategoriesComponentsState extends State<CategoriesComponents> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<AllCategoriesProvider>(context, listen: false)
        .getAllCategories();
  }

  @override
  Widget build(BuildContext context) {
    bool loading = false;
    // final categoriesData = categoriesDataList(context);
    return Consumer<AllCategoriesProvider>(
      builder: (context, getAllCategoriesProvider, child) {
        print(
            "Model length = ${getAllCategoriesProvider.myCategoriesList.length} ");
        // if (loading == false) {
        //   getAllCategoriesProvider.getAllCategories().then((value) {
        //     return const CircularProgressIndicator(color: Colors.orangeAccent);
        //   });
        //   loading = true;
        // }
        return getAllCategoriesProvider.myCategoriesList.length != 0
            ? getAllCategoriesProvider.myCategoriesList[0].categories?.length !=
                    0
                ? SizedBox(
                    height: 250.h,
                    child: GridView.builder(
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: getAllCategoriesProvider
                          .myCategoriesList[0].categories?.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: 120.h, // Increase the mainAxisExtent
                        crossAxisCount: 3,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                      ),
                      itemBuilder: (context, index) {
                        var data = getAllCategoriesProvider
                            .myCategoriesList[0].categories?[index];
                        print(
                            "name === ${getAllCategoriesProvider.myCategoriesList[0].categories?[index].name}");
                        print(
                            "image === ${getAllCategoriesProvider.myCategoriesList[0].categories?[index].image}");

                        return Container(
                          width: 99.w,
                          height: 97.h,

                          // padding: EdgeInsets.all(12.r),
                          decoration: BoxDecoration(
                            color: AppColors.textColor,
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.bgColor.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                // padding:  EdgeInsets.symmetric(horizontal: 12.w,vertical: 24.h),
                                padding: EdgeInsets.only(top: 7.h, bottom: 5.h),
                                child: Container(
                                  width: 50.w,
                                  height: 50.h,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            AppColors.bgColor.withOpacity(0.2),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: Offset(0, 3),
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(8.r),
                                    color: AppColors.textColor,
                                  ),
                                  child: Center(
                                    child: Image.network(
                                      AppUrls.imageUrl + data!.image.toString(),
                                      // width: categoriesData[index].imageWidth,
                                      // height: categoriesData[index].imageHeight,
                                      // ignore: deprecated_member_use
                                      color: AppColors.bgColor,
                                      width: 30,
                                      height: 30,
                                    ),
                                  ),
                                ),
                              ),
                              // CustomSizedBox(height: 5.h),
                              CustomText(
                                text: data!.name.toString(),
                                style: AppTextStyles.fontSize14to700.copyWith(
                                  fontSize: 12,
                                  color: AppColors.bgColor,
                                  // maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                // Add ellipsis for long text
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  )
                : Center(
                    child: Text(
                    "No Data Found",
                    style: TextStyle(color: Colors.white),
                  ))
            : SizedBox(
                height: 250.h,
                child: GridView.builder(
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 5,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 120.h, // Increase the mainAxisExtent
                    crossAxisCount: 3,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return Shimmer.fromColors(
                      direction: ShimmerDirection.ttb,
                        child: Container(
                          width: 99.w,
                          height: 97.h,

                          // padding: EdgeInsets.all(12.r),
                          decoration: BoxDecoration(
                            color: AppColors.textColor,
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.bgColor.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                // padding:  EdgeInsets.symmetric(horizontal: 12.w,vertical: 24.h),
                                padding: EdgeInsets.only(top: 7.h, bottom: 5.h),
                                child: Container(
                                  width: 50.w,
                                  height: 50.h,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            AppColors.bgColor.withOpacity(0.2),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: Offset(0, 3),
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(8.r),
                                    color: AppColors.textColor,
                                  ),
                                  child: Center(
                                    child: Image.network(
                                      "",
                                      color: AppColors.bgColor,
                                      width: 30,
                                      height: 30,
                                    ),
                                  ),
                                ),
                              ),
                              // CustomSizedBox(height: 5.h),
                              CustomText(
                                text: "",
                                style: AppTextStyles.fontSize14to700.copyWith(
                                  fontSize: 12,
                                  color: AppColors.bgColor,
                                  // maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                // Add ellipsis for long text
                              )
                            ],
                          ),
                        ),
                        baseColor: Colors.white,
                        highlightColor: Colors.white10);
                  },
                ),
              );
      },
    );
  }
}
