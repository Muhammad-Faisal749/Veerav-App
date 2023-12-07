import 'dart:io';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../Model/camera_model/camera_model.dart';

import '../../utils/app_constants/app_constant.dart';
import '../../utils/app_images/app_images.dart';
import '../../widgets/custom_sized_box/custom_sized_box.dart';
import '../details/details.dart';

class CameraScreen extends StatefulWidget {
  final List<CameraDescription> cameras;

  CameraScreen(this.cameras);

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController? controller;
  bool _isFlashOn = false;
  XFile? capturedImage;
  String cameraPath = '';
  String galleryPath = '';

  @override
  ///camera
  void initState() {
    super.initState();
    if (widget.cameras.isNotEmpty) {
      controller = CameraController(widget.cameras[0], ResolutionPreset.max);
      controller!.initialize().then((_) {
        if (!mounted) {
          return;
        }
        setState(() {});
      });
    }
  }
///Disposing my camera controller
  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  ///Capturing Picture and saves in a gallery and showing in details screen
  Future<void> _capturePhoto() async {
    if (controller == null || !controller!.value.isInitialized) {
      print('Error: Camera not initialized');
      return;
    }

    try {
      final XFile capturedImageFile = await controller!.takePicture();
      setState(() {
        capturedImage = XFile(capturedImageFile.path);
        cameraPath = capturedImage!.path.toString();
        AppTexts.imagesfiles.add(cameraPath);
        // Get.to(Details());

        print('camera pic path ${capturedImage!.path.toString()}');
      });
    } catch (e) {
      print("Error capturing image: $e");
    }
  }

  ///flash on/off function

  void _toggleFlash() {
    if (controller != null && controller!.value.isInitialized) {
      if (_isFlashOn) {
        controller!.setFlashMode(FlashMode.off);
      } else {
        controller!.setFlashMode(FlashMode.torch);
      }
      setState(() {
        _isFlashOn = !_isFlashOn;
      });
    }
  }

  ///open gallery and aves image in a details screen
  void _openGallery() async {
    final XFile? image =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {});
    if (image != null) {
      print("Selected image from gallery: ${image.path}");
      Navigator.pop(context);
      galleryPath = image.path;
      AppTexts.imagesfiles.add(galleryPath);

      print('list file is ${AppTexts.imagesfiles}');
      print('list file length is ${AppTexts.imagesfiles.length}');
      // Get.offAll(Details());
      setState(() {});
      print('galleryPath is ${galleryPath}');
    } else {
      print("No image selected from gallery");
    }
  }

  ///Saving Image Function
  void _onSaveImage() async {
    if (capturedImage != null) {
      final result = await GallerySaver.saveImage(capturedImage!.path);
      if (result != null) {
        // Details(
        //     // images: capturedImage,
        //     );
        print("Image saved to the gallery");
        print(" ***************** on save ********************if");
        Navigator.pop(context);
        setState(() {});
        // Get.to(Details());
      } else {
        print(" ***************** on save ********************else ");
        print("Failed to save the image to the gallery");
      }

      setState(() {
        capturedImage = null;
      });
    }
  }

  void _onDiscardImage() {
    setState(() {
      capturedImage = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:  Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: [
                if (controller != null && controller!.value.isInitialized)
                  Positioned.fill(
                    top: 0.h,
                    bottom: 0.w,
                    child: AspectRatio(
                      aspectRatio: controller!.value.aspectRatio,
                      child: CameraPreview(controller!),
                    ),
                  ),
                Positioned(
                  top: 0.h,
                  left: 0.w,
                  child: Container(
                    color: Colors.transparent,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios_sharp,
                          color: Colors.white, size: 25),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
                if (capturedImage != null)
                  Positioned.fill(
                    child: Image.file(
                      File(capturedImage!.path),
                      fit: BoxFit.cover,
                    ),
                  ),
                Positioned(
                  left: 0.h,
                  right: 0.w,
                  bottom: 120.h,
                  child: Container(
                    height: 126.h,
                    color: const Color(0x7F1C1C1E),
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: myCameraData.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.all(8.r),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 8.h,
                              ),
                              Container(
                                width: 81.w,
                                height: 81.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16.r),
                                  color: Colors.white,
                                ),
                                child: Center(
                                  child: Image.asset(
                                    AppImages.appearanceCamera,
                                    width: 28.w,
                                    height: 23.h,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              CustomSizedBox(height: 5.h),
                              Text(
                                myCameraData[index].text.toString(),
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0.h,
                  left: 0.w,
                  right: 0.w,
                  child: Container(
                    height: 100.h,
                    color: Colors.black,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50.r),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              _openGallery();
                              // Get.offAll(Details());
                            },
                            child: Image.asset(
                              AppImages.galleryImage,
                              width: 26.w,
                              height: 25.h,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              print('images list are ${AppTexts.imagesfiles}');
                              if (capturedImage == null) {
                                _capturePhoto();
                              } else {
                                _onSaveImage();
                                // Get.to(Details());
                                // Navigator.pop(context);
                              }
                            },
                            child: capturedImage == null
                                ? Image.asset(
                              AppImages.cameraImage,
                              width: 75.w,
                              height: 75.h,
                            )
                                : const Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              _toggleFlash();
                            },
                            child: Icon(
                              _isFlashOn ? Icons.flash_on : Icons.flash_off,
                              color: Colors.white,
                              size: 25,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
