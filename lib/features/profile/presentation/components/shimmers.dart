import 'package:chef_app_round_two/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class TextShimmer extends StatelessWidget {
  const TextShimmer({
    super.key,  this.width = 100,
  });
  final double width;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.grey,
      highlightColor: AppColors.white,
      enabled: true,
      child: Container(
        width: width,
        height: 20.h,
        decoration: BoxDecoration(
          color: AppColors.grey.withOpacity(0.5),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

class ImageShimmer extends StatelessWidget {
  const ImageShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: AppColors.grey,
        highlightColor: AppColors.white,
        enabled: true,
        child: CircleAvatar(
          radius: 90,
          backgroundColor: AppColors.grey.withOpacity(0.85),
        ));
  }
}
