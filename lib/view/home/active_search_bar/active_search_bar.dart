import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swooshed_app/utils/app_styles/app_text_styles.dart';
import 'package:swooshed_app/utils/app_colors/app_colors.dart';

class ActiveSearchBar extends StatefulWidget {


  void Function(String)? onChanged;

  ActiveSearchBar({this.onChanged, Key? key})
      : super(key: key);

  @override
  State<ActiveSearchBar> createState() => _ActiveSearchBarState();
}

class _ActiveSearchBarState extends State<ActiveSearchBar> {
  @override
  void dispose() {
    searchController!.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }
  TextEditingController? searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///Active Search Bar
        Container(
          height: 32.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.r),
            color: AppColors.textColor,
          ),
          child: TextFormField(
            cursorColor: AppColors.bgColor,
            maxLines: 1,
            keyboardType: TextInputType.text,
            onTap: () {},
            textAlign: TextAlign.start,
            controller: searchController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4.r),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(4.r),
              ),
              hintText: "Search every product here",
              hintStyle: AppTextStyles.fontSize12to300.copyWith(
                color: AppColors.btnTextColor,
              ),
              prefixIcon: Icon(
                Icons.search,
                size: 20,
                color: AppColors.bgColor,
              ),
              filled: true,
            ),
          ),
        ),
      ],
    );
  }
}
