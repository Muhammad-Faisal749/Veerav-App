import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:swooshed_app/utils/app_colors/app_colors.dart';
import 'package:swooshed_app/utils/app_images/app_images.dart';
import 'package:swooshed_app/utils/app_styles/app_text_styles.dart';
import 'package:swooshed_app/utils/app_urls/app_urls.dart';
import 'package:swooshed_app/view/home/active_search_bar/active_search_bar.dart';
import 'package:swooshed_app/widgets/custom_text/custom_text.dart';

import '../../../controller/home_provider/home_provider.dart';

class HomePageViewComponent extends StatefulWidget {
  // TextEditingController SearchController =TextEditingController();

  HomePageViewComponent({super.key});

  @override
  _HomePageViewComponentState createState() => _HomePageViewComponentState();
}

class _HomePageViewComponentState extends State<HomePageViewComponent> {
  final controller = PageController();
  int currentPage = 0;
  bool _isVisible = false;
  var posterData;

  ///Page changes after 3 seconds,Function of Page view
  @override
  @override
  void initState() {
    super.initState();
    Provider.of<HomeProvider>(context, listen: false).getPosterApi();
    // print( Provider.of<HomeProvider>(context, listen: false).getPosterApi());

    // Timer.periodic(const Duration(seconds: 3), (timer) {
    //   if (currentPage <
    //       Provider.of<HomeProvider>(
    //         context,
    //       ).myPosterList[0].poster.length) {
    //     currentPage++;
    //   } else {
    //     currentPage = 0;
    //   }
    //   controller.animateToPage(
    //     currentPage,
    //     duration: const Duration(seconds: 1),
    //     curve: Curves.easeInOut,
    //   );
    // });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, getHomeProvider, child) {
        // Timer.periodic(const Duration(seconds: 1), (timer) {
        //   if (currentPage < getHomeProvider.myPosterList[0].poster.length) {
        //     // currentPage = currentPage + 1;
        //     currentPage++;
        //   } else {
        //     currentPage = 0;
        //   }
        //   controller.animateToPage(
        //     currentPage,
        //     duration: const Duration(milliseconds: 400),
        //     curve: Curves.easeInOut,
        //   );
        // });
        // if (loading = false) {
        //   getHomeProvider.getPosterApi().then((value) {
        //     return Center(
        //       child: CircularProgressIndicator(
        //         color: Colors.white,
        //       ),
        //     );
        //   });
        //   loading = true;
        // }
        // print(
        //     "*****************  ${getHomeProvider.myPosterList[0]}  DATA *******************************");
        return getHomeProvider.myPosterList.length == 0
            ? Center(child: CircularProgressIndicator())
            : Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    height: 180.h,
                    width: MediaQuery.of(context).size.width,
                    child: PageView.builder(
                      controller: controller,
                      itemCount: getHomeProvider.myPosterList[0].poster.length,
                      scrollDirection: Axis.horizontal,
                      onPageChanged: (page) {
                        setState(() {
                          currentPage = page;
                        });
                      },
                      itemBuilder: (context, index) {
                        ///page view bg Image
                        // if(posterData.poster!.isNotEmpty){
                        //   return ;
                        // }else{
                        //   return Center(child: CircularProgressIndicator());
                        // }
                        return Container(
                            width: 200.w,
                            decoration: BoxDecoration(
                              // gradient: AppColors.textGradient,
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                alignment: Alignment.bottomCenter,
                                image: NetworkImage(
                                  AppUrls.imageUrl +
                                      getHomeProvider
                                          .myPosterList[0].poster[index].image,
                                ),
                              ),
                            ));
                      },
                    ),
                  ),

                  ///page view controller
                  Positioned(
                    bottom: 12.h,
                    left: 20.w,
                    child: SmoothPageIndicator(
                      controller: controller,
                      count: getHomeProvider.myPosterList[0].poster.length,
                      effect: const ExpandingDotsEffect(
                        dotHeight: 8,
                        dotColor: Colors.white,
                        dotWidth: 8,
                      ),
                      onDotClicked: (index) => controller.animateToPage(index,
                          duration: const Duration(seconds: 1),
                          curve: Curves.easeInOut),
                    ),
                  ),

                  ///Search bar and Search field
                  Positioned(
                    top: 5,
                    // left: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // SizedBox(height: 28.h, width: 250.w, child: SearchBar()),
                        _isVisible == false
                            ? Container(
                                // height: 24.h,
                                padding: EdgeInsets.symmetric(vertical: 6.h),
                                width: 220.w,
                                decoration: BoxDecoration(
                                    // color: Colors.red,
                                    image: DecorationImage(
                                        image: AssetImage(
                                  AppImages.searchBg,
                                ))),

                                ///InActive search Field
                                child: Center(
                                  child: CustomText(
                                    text:
                                        "Find more checking product result here!",
                                    style: AppTextStyles.fontSize10to500
                                        .copyWith(
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.textColor),
                                  ),
                                ),
                              )

                            ///Back Icon and Active Search Bar
                            : Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ///Back Icon Button
                                  IconButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      icon: Icon(
                                        Icons.arrow_back_ios,
                                        size: 25,
                                        color: AppColors.textColor,
                                      )),

                                  ///Active search Bar
                                  SizedBox(
                                      height: 32.h,
                                      width: 230.w,
                                      child: ActiveSearchBar()),
                                ],
                              ),
                        SizedBox(
                          width: 4.w,
                        ),

                        ///Search Icon to visible Active search bar
                        _isVisible == false
                            ? GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _isVisible = !_isVisible;
                                  });
                                },
                                child: SizedBox(
                                    width: 16.w,
                                    height: 17.h,
                                    child: const Icon(
                                      Icons.search,
                                      color: AppColors.textColor,
                                    )),
                              )
                            : SizedBox.shrink(),
                      ],
                    ),
                  )
                ],
              );
      },
    );
  }
}
