import 'package:chef_app_round_two/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomSpiner extends StatelessWidget {
  const CustomSpiner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: SpinKitFadingCircle(
            color: AppColors.primary,
            size: 30,
          ),
        ),
      ],
    );
  }
}
