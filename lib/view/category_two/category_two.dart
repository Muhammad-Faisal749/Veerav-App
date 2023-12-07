import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_file/open_file.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:swooshed_app/utils/app_colors/app_colors.dart';
import 'package:swooshed_app/utils/app_styles/app_text_styles.dart';
import 'package:swooshed_app/widgets/custom_image/custom_image.dart';
import 'package:swooshed_app/widgets/custom_text/custom_text.dart';

import '../../model/detail_model/detail_model.dart';
import '../../utils/app_images/app_images.dart';
import '../../widgets/custom_container/custom_container.dart';
import 'components/image_guidance.dart';

class CategoryTwo extends StatefulWidget {
  const CategoryTwo({super.key});

  @override
  State<CategoryTwo> createState() => _CategoryTwoState();
}

class _CategoryTwoState extends State<CategoryTwo> {
  List<DetailModel> _detailLists(BuildContext context) {
    return [
      DetailModel(
          text: AppLocalizations.of(context)!.appearance,
          imgUrl: AppImages.appearance2),
      DetailModel(
          text: AppLocalizations.of(context)!.frontSide,
          imgUrl: AppImages.front_side2),
      DetailModel(
          text: AppLocalizations.of(context)!.backSide,
          imgUrl: AppImages.back_side2),
      DetailModel(
          text: AppLocalizations.of(context)!.inside,
          imgUrl: AppImages.inside2),
      DetailModel(
          text: AppLocalizations.of(context)!.priceTag,
          imgUrl: AppImages.price_tag2),
      DetailModel(
          text: AppLocalizations.of(context)!.sideTag,
          imgUrl: AppImages.side_tag2),
      DetailModel(
          text: AppLocalizations.of(context)!.receipt,
          imgUrl: AppImages.receipt2),
    ];
  }

  List<PlatformFile?> selectedFiles = List.filled(12, null);

  FilePickerResult? result;
  PlatformFile? file;

  void PickFile(int index) async {
    result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );
    if (result == null) {
      return;
    } else {
      //file = result!.files.first;
      selectedFiles[index] = result!.files.first;
      viewFile(selectedFiles[index]!);
      //viewFile(file!);
      setState(() {});
    }
  }

  void viewFile(PlatformFile file) {
    OpenFile.open(file.path);
  }

  @override
  Widget build(BuildContext context) {
    final _detailList = _detailLists(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
          child: Column(
            children: [
              ImageGuidance(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: AppLocalizations.of(context)!.this_is_the_examples,
                      textAlign: TextAlign.start,
                      style: AppTextStyles.fontSize14to400,
                    ),
                    SizedBox(height: 24.h),
                    GridView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: _detailList.length,
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 8,
                          mainAxisExtent: 100.h),
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Expanded(
                              child: CustomContainer(
                                height: 120.h,
                                width: 98.w,
                                color: AppColors.textColorWhite,
                                // gradient: AppColors.mediumGradient,
                                borderRadius: BorderRadius.circular(10.r),
                                child: InkWell(
                                  onTap: () {
                                    PickFile(index);
                                  },
                                  child: selectedFiles[index] == null
                                      ? Center(
                                          child: CustomImage(
                                            height: 25.h,
                                            width: 34.w,
                                            color: AppColors.bgColor,
                                            imgUrl: _detailList[index].imgUrl,
                                          ),
                                        )
                                      : Image.file(
                                          File(
                                            selectedFiles[index]!.path!,
                                          ),
                                          fit: BoxFit.cover,
                                          color: AppColors.bgColor,
                                        ),
                                ),
                              ),
                            ),
                            SizedBox(height: 5),
                            CustomText(
                              text: _detailList[index].text,
                              style: AppTextStyles.fontSize14to400.copyWith(
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.35,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
