import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:swooshed_app/utils/app_styles/app_text_styles.dart';
import 'package:swooshed_app/utils/app_urls/app_urls.dart';

import '../../../Model/brand_model/brand_model.dart';
import '../../../controller/brand_provider/brand_provider.dart';
import '../../../utils/app_colors/app_colors.dart';
import '../../../widgets/custom_container/custom_container.dart';
import '../../../widgets/custom_text/custom_text.dart';

class ChooseBrandData extends StatefulWidget {
  @override
  State<ChooseBrandData> createState() => _ChooseBrandDataState();
}

class _ChooseBrandDataState extends State<ChooseBrandData> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<ChooseBrandProvider>(context, listen: false).getAllBrands();
  }

  @override
  Widget build(BuildContext context) {

    return Consumer<ChooseBrandProvider>(
      builder: (context, getChooseBrandProvider, child) {
        return getChooseBrandProvider.myBrandList.length != 0
            ? getChooseBrandProvider.myBrandList[0].brand!.length != 0
                ? ListView.builder(
                    // physics: BouncingScrollPhysics(),
                    itemCount:
                        getChooseBrandProvider.myBrandList[0].brand!.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      var brandData = getChooseBrandProvider.myBrandList[0];
                      return GestureDetector(
                        onTap: () async {
                          getChooseBrandProvider.selectedIndex(index);
                          SharedPreferences sp =
                              await SharedPreferences.getInstance();
                          sp.setString(
                              "valueBrands",
                              getChooseBrandProvider
                                  .myBrandList[0].brand![index].sId
                                  .toString());
                          sp.getString("valueBrands") ?? '';
                          print(
                              "***** --- User Token of brands = ${getChooseBrandProvider.myBrandList[0].brand![index].sId} --------**********");
                        },
                        child: CustomContainer(
                          margin: EdgeInsets.only(bottom: 12.r),
                          padding: EdgeInsets.symmetric(
                              horizontal: 5, vertical: 5.r),
                          width: MediaQuery.of(context).size.width,
                          borderRadius: BorderRadius.circular(10),
                          color: getChooseBrandProvider.currentIndex == index
                              ? Colors.greenAccent
                              : AppColors.textColor,
                          child: ListTile(
                            leading: Container(
                              padding: EdgeInsets.all(8.r),
                              height: 50.h,
                              width: 55.w,
                              decoration: BoxDecoration(
                                color: AppColors.textColor,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(0, 4),
                                    blurRadius: 5,
                                    spreadRadius: 1,
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(18.r),
                              ),
                              child: Center(
                                child: Image.network(
                                  // "",
                                  AppUrls.imageUrl +
                                      brandData.brand![index].logo.toString(),
                                  width:
                                      30, // Add this line to specify the width
                                ),
                              ),
                            ),
                            title: CustomText(
                              textAlign: TextAlign.start,
                              text: brandData.brand![index].tag.toString(),
                              style: AppTextStyles.fontSize14to400
                                  .copyWith(color: AppColors.bgColor)
                                  .copyWith(
                                    letterSpacing: 0.35,
                                    fontWeight: FontWeight.w300,
                                  ),
                            ),
                            subtitle: CustomText(
                              textAlign: TextAlign.start,
                              text: brandData.brand![index].name.toString(),
                              style: AppTextStyles.fontSize17to600.copyWith(
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 0.35,
                                  color: AppColors.bgColor),
                            ),
                          ),
                        ),
                      );
                    },
                  )
                : Center(
                    child: CustomText(
                      text: "No Data Found",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
            : Center(child: CircularProgressIndicator());

        ();
      },
    );
  }
}
