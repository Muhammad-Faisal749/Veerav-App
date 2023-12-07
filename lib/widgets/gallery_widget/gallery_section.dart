import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swooshed_app/utils/app_colors/app_colors.dart';
import 'package:swooshed_app/utils/app_images/app_images.dart';
import 'package:image_picker/image_picker.dart';

class GallerySection extends StatefulWidget {
  const GallerySection({Key? key}) : super(key: key);

  @override
  State<GallerySection> createState() => _GallerySectionState();
}

class _GallerySectionState extends State<GallerySection> {
  List<XFile?> pickedImages = List.filled(9, null);

  Future<void> _pickImage(int index) async {
    final picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        pickedImages[index] = pickedFile;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270.h,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        physics: NeverScrollableScrollPhysics(),
        itemCount: 9,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => _pickImage(index),
            child: Container(
              // padding: EdgeInsets.all(30),
              decoration: ShapeDecoration(
                color: AppColors.textColorWhite,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.r),
                ),
              ),
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.r),
                  child: pickedImages[index] != null
                      ? Image.file(
                          File(pickedImages[index]!.path),
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        )
                      : Image.asset(
                          AppImages.ypurauthenticationgalleypicturelogo,
                          color: AppColors.bgColor,
                          width: 25,
                          height: 25,
                        ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
