import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:swooshed_app/controller/home_provider/home_provider.dart';
import 'package:swooshed_app/utils/app_colors/app_colors.dart';
import 'package:swooshed_app/utils/app_images/app_images.dart';
import 'package:swooshed_app/utils/app_styles/app_text_styles.dart';
import 'package:swooshed_app/utils/app_urls/app_urls.dart';
import 'package:swooshed_app/view/home/active_search_bar/active_search_bar.dart';
import 'package:swooshed_app/widgets/custom_text/custom_text.dart';

import '../shimmer/poster_shimmer_effects.dart';

class HomePageViewComponent extends StatefulWidget {
  HomePageViewComponent({super.key});

  @override
  _HomePageViewComponentState createState() => _HomePageViewComponentState();
}

class _HomePageViewComponentState extends State<HomePageViewComponent> {
  final controller = PageController();
  int currentPage = 0;
  bool _isVisible = false;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      Provider.of<HomeProvider>(context, listen: false).getPosterApi();
    });
    timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (currentPage <
          Provider.of<HomeProvider>(context, listen: false)
              .myPosterList[0]
              .poster
              .length) {
        currentPage++;
      } else {
        currentPage = 0;
      }
      controller.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, getHomeProvider, child) {
        if (getHomeProvider.myPosterList.isEmpty) {
          return Center(child: PageViewShimmerEffect());
        }
        return Stack(
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
                  return Container(
                    width: 200.w,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        alignment: Alignment.bottomCenter,
                        image: NetworkImage(
                          AppUrls.imageUrl +
                              getHomeProvider
                                  .myPosterList[0].poster[index].image,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
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
            Positioned(
              top: 5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _isVisible == false
                      ? Container(
                    padding: EdgeInsets.symmetric(vertical: 6.h),
                    width: 220.w,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(AppImages.searchBg),
                      ),
                    ),
                    child: Center(
                      child: CustomText(
                        text:
                        "Find more checking product result here!",
                        style: AppTextStyles.fontSize10to500.copyWith(
                          fontWeight: FontWeight.w400,
                          color: AppColors.textColor,
                        ),
                      ),
                    ),
                  )
                      : Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            _isVisible = !_isVisible;
                          });
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          size: 25,
                          color: AppColors.textColor,
                        ),
                      ),
                      SizedBox(
                        height: 32.h,
                        width: 230.w,
                        child: ActiveSearchBar(),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
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
                      ),
                    ),
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
